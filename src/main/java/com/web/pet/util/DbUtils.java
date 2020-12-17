package com.web.pet.util;

import lombok.extern.slf4j.Slf4j;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 資料庫處理共用
 *
 * @author Jimmy Kang
 */
@Slf4j
public class DbUtils implements AutoCloseable {

    // 資料庫連線
    private Connection connection;
    // log等級
    private LogLevel logLevel = LogLevel.ERROR;
    // 是否要log sql字串
    private boolean isLogSql = true;
    // 連線分配位置
    private final String allocTrace;
    // 初始化方式
    private final boolean isUsedContext;

    // context資料庫連線設定檔key
    private String contextDbConnectKey;

    // 資料庫連線資料
    private String dbUrl;
    private String dbUser;
    private String dbPwd;

    // 資料庫儲存節點
    private Savepoint savepoint;

    /** log等級 */
    public enum LogLevel {
        DEBUG,
        INFO,
        WARN,
        ERROR,
        NONE
    }

    /**
     * 初始化
     *
     * @throws SQLException SQL錯誤
     */
    public DbUtils() throws SQLException {
//        isUsedContext = true;
//        this.contextDbConnectKey = "jdbc/test";
//        getConnection();
//        allocTrace = getAllocTrace();
        isUsedContext = false;
        this.dbUrl = "jdbc:sqlserver://localhost:1433;databaseName=PetDB";
        this.dbUser = "scott";
        this.dbPwd = "tiger";
        getConnection();
        allocTrace = getAllocTrace();
    }

    /**
     * 初始化
     *
     * @param url 資料庫url
     * @param user 使用者名稱
     * @param pwd 資料庫密碼
     * @throws SQLException SQL錯誤
     */
    public DbUtils(String url, String user, String pwd) throws SQLException {
        isUsedContext = false;
        this.dbUrl = url;
        this.dbUser = user;
        this.dbPwd = pwd;
        getConnection();
        allocTrace = getAllocTrace();
    }

    /**
     * 設定連線
     *
     * @throws SQLException SQL錯誤
     */
    public Connection getConnection() throws SQLException {
        if (null != connection) {
            return connection;
        }
        try {
            if (isUsedContext) {
                Context initCtx = new InitialContext();
                Context envCtx = (Context) initCtx.lookup("java:/comp/env");
                DataSource ds = (DataSource) envCtx.lookup(contextDbConnectKey);
                connection = ds.getConnection();
            } else {
                connection = DriverManager.getConnection(dbUrl, dbUser, dbPwd);
            }
            connection.setAutoCommit(false);

        } catch (NamingException e) {
            logString("讀取context資料庫設定檔失敗");
        }
        return connection;
    }

    /**
     * 取得連線分配位置
     *
     * @return 連線分配位置
     */
    private String getAllocTrace() {
        StackTraceElement[] trace = Thread.currentThread().getStackTrace();
        StringBuilder traceStr = new StringBuilder();
        for (int i = 0; i < trace.length && i < 10; i++) {
            traceStr.append(trace[i].toString());
            traceStr.append('\n');
        }
        return traceStr.toString();
    }

    /** 關閉連線 */
    @Override
    public void close() {
        try {
            if (connection != null) connection.close();
        } catch (SQLException e) {
            logString("資料庫連線關閉失敗");
        }
        connection = null;
    }

    /** 結束檢查是否關閉連線 */
    protected void finalize() throws Throwable {
        super.finalize();
        if (connection != null && allocTrace != null) {
            logString("未釋放連線:\n" + allocTrace);
        }
    }

    /**
     * 設定log等級(不設定預設等級為ERROR)
     *
     * @param logLevel log等級
     * @return 原方法
     */
    public DbUtils setLogLevel(LogLevel logLevel) {
        this.logLevel = logLevel;
        return this;
    }

    /**
     * 設定是否log sql語法
     *
     * @param isLogSql log等級
     * @return 原方法
     */
    public DbUtils setLogSql(boolean isLogSql) {
        this.isLogSql = isLogSql;
        return this;
    }

    /**
     * log分級印出
     *
     * @param object 要log的物件
     */
    private void logString(Object object) {
        switch (logLevel) {
            case INFO:
                log.info(object.toString());
                break;
            case DEBUG:
                log.debug(object.toString());
                break;
            case WARN:
                log.warn(object.toString());
                break;
            case ERROR:
                log.error(object.toString());
                break;
            default:
                break;
        }
    }

    /**
     * log印出SQL語法
     *
     * @param sql SQL語法
     */
    private void logSql(String sql) {
        if (isLogSql) {
            log.debug(sql);
        }
    }

    public Savepoint getSavePoint() throws SQLException {
        savepoint = getConnection().setSavepoint();
        return savepoint;
    }

    public void relSavePoint(Savepoint savepoint) throws SQLException {
        getConnection().releaseSavepoint(savepoint);
    }

    public void relSavePoint() throws SQLException {
        if (null != savepoint) getConnection().releaseSavepoint(savepoint);
    }

    public void rollbackSavePoint(Savepoint savepoint) throws SQLException {
        getConnection().rollback(savepoint);
    }

    public void rollbackSavePoint() throws SQLException {
        if (null != savepoint) getConnection().rollback(savepoint);
    }

    public void doCommit() {
        try {
            if (connection != null) connection.commit();
        } catch (SQLException e) {
            logString("commit失敗: " + ExceptionUtils.getErrorDetail(e));
        }
    }

    public void doRollback() {
        try {
            if (connection != null) connection.rollback();
        } catch (SQLException e) {
            logString("rollback失敗: " + ExceptionUtils.getErrorDetail(e));
        }
    }

    public CallableStatement buildCall(Connection conn, String sql) throws SQLException {
        logSql("SQL: " + sql);
        CallableStatement st = conn.prepareCall(sql);
        return st;
    }

    public CallableStatement buildCall(String sql) throws SQLException {
        return buildCall(getConnection(), sql);
    }

    public PreparedStatement buildStatement(Connection conn, String sql) throws SQLException {
        logSql("SQL: " + sql);
        PreparedStatement st = conn.prepareStatement(sql);
        return st;
    }

    public PreparedStatement buildStatement(String sql) throws SQLException {
        return buildStatement(getConnection(), sql);
    }

    public void bindParameter(PreparedStatement st, int pos, Object val) throws SQLException {
        logSql("  bind " + pos + ": " + val + " (" + (val != null ? val.getClass() : "") + ")");
        st.setObject(pos, val);
    }

    public void bindParameterArray(PreparedStatement st, Object[] args) throws SQLException {
        for (int i = 0; i < args.length; i++) bindParameter(st, i + 1, args[i]);
    }

    public void bindParameterList(PreparedStatement st, Object... args) throws SQLException {
        bindParameterArray(st, args);
    }

    public ResultSet queryArray(Connection conn, String sql, Object[] args) throws SQLException {
        PreparedStatement st = buildStatement(conn, sql);
        bindParameterArray(st, args);
        return st.executeQuery();
    }

    public ResultSet queryArray(String sql, Object[] args) throws SQLException {
        return queryArray(getConnection(), sql, args);
    }

    public ResultSet queryList(Connection conn, String sql, Object... args) throws SQLException {
        return queryArray(conn, sql, args);
    }

    public ResultSet queryList(String sql, Object... args) throws SQLException {
        return queryArray(getConnection(), sql, args);
    }

    public int selectIntArray(Connection conn, String sql, Object[] args) throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        int cnt = 0;
        if (rs.next()) cnt = rs.getInt(1);
        rs.close();
        return cnt;
    }

    public int selectIntArray(String sql, Object[] args) throws SQLException {
        return selectIntArray(getConnection(), sql, args);
    }

    public int selectIntList(Connection conn, String sql, Object... args) throws SQLException {
        return selectIntArray(conn, sql, args);
    }

    public int selectIntList(String sql, Object... args) throws SQLException {
        return selectIntArray(getConnection(), sql, args);
    }

    public double selectDoubleArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        double cnt = 0;
        if (rs.next()) cnt = rs.getDouble(1);
        rs.close();
        return cnt;
    }

    public double selectDoubleArray(String sql, Object[] args) throws SQLException {
        return selectDoubleArray(getConnection(), sql, args);
    }

    public double selectDoubleList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectDoubleArray(conn, sql, args);
    }

    public double selectDoubleList(String sql, Object... args) throws SQLException {
        return selectDoubleArray(getConnection(), sql, args);
    }

    public boolean selectBooleanArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        boolean cnt = false;
        if (rs.next()) cnt = rs.getBoolean(1);
        rs.close();
        return cnt;
    }

    public boolean selectBooleanList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectBooleanArray(conn, sql, args);
    }

    public boolean selectBooleanList(String sql, Object... args) throws SQLException {
        return selectBooleanArray(getConnection(), sql, args);
    }

    public String selectStringArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        String result = null;
        if (rs.next()) result = rs.getString(1);
        rs.close();
        return result;
    }

    public String selectStringArray(String sql, Object[] args) throws SQLException {
        return selectStringArray(getConnection(), sql, args);
    }

    public String selectStringList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectStringArray(conn, sql, args);
    }

    public String selectStringList(String sql, Object... args) throws SQLException {
        return selectStringArray(getConnection(), sql, args);
    }

    public Object selectObjectArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        Object result = null;
        if (rs.next()) result = rs.getObject(1);
        rs.close();
        return result;
    }

    public Object selectObjectArray(String sql, Object[] args) throws SQLException {
        return selectObjectArray(getConnection(), sql, args);
    }

    public Object selectObjectList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectObjectArray(conn, sql, args);
    }

    public Object selectObjectList(String sql, Object... args) throws SQLException {
        return selectObjectArray(getConnection(), sql, args);
    }

    public List<Object> selectListRowArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        int cnt = rs.getMetaData().getColumnCount();
        List<Object> row = null;
        if (rs.next()) {
            row = new ArrayList<Object>();
            for (int i = 1; i <= cnt; i++) row.add(rs.getObject(i));
        }
        rs.close();
        return row;
    }

    public List<Object> selectListRowArray(String sql, Object[] args) throws SQLException {
        return selectListRowArray(getConnection(), sql, args);
    }

    public List<Object> selectListRowList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectListRowArray(conn, sql, args);
    }

    public List<Object> selectListRowList(String sql, Object... args) throws SQLException {
        return selectListRowArray(getConnection(), sql, args);
    }

    public Map<String, Object> selectMapRowArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        ResultSetMetaData rsm = rs.getMetaData();
        Map<String, Object> row = null;
        if (rs.next()) {
            row = new HashMap<>();
            int cnt = rsm.getColumnCount();
            for (int i = 1; i <= cnt; i++) row.put(rsm.getColumnLabel(i), rs.getObject(i));
        }
        rs.close();
        return row;
    }

    public Map<String, Object> selectMapRowArray(String sql, Object[] args) throws SQLException {
        return selectMapRowArray(getConnection(), sql, args);
    }

    public Map<String, Object> selectMapRowList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectMapRowArray(conn, sql, args);
    }

    public Map<String, Object> selectMapRowList(String sql, Object... args) throws SQLException {
        return selectMapRowArray(getConnection(), sql, args);
    }

    public List<String> selectStringAllArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        List<String> all = new ArrayList<>();
        while (rs.next()) {
            all.add(rs.getString(1));
        }
        rs.close();
        return all;
    }

    public List<String> selectStringAllArray(String sql, Object[] args) throws SQLException {
        return selectStringAllArray(getConnection(), sql, args);
    }

    public List<String> selectStringAllList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectStringAllArray(conn, sql, args);
    }

    public List<String> selectStringAllList(String sql, Object... args) throws SQLException {
        return selectStringAllArray(getConnection(), sql, args);
    }

    public Map<String, Object> selectKeyRowArray(
            Connection conn, String sql, String keyField, String valueField, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        Map<String, Object> all = new HashMap<String, Object>();
        while (rs.next()) {
            all.put(rs.getString(keyField), valueField != null ? rs.getObject(valueField) : null);
        }
        rs.close();
        return all;
    }

    public Map<String, Object> selectKeyRowArray(
            String sql, String keyField, String valueField, Object[] args) throws SQLException {
        return selectKeyRowArray(getConnection(), sql, keyField, valueField, args);
    }

    public Map<String, Object> selectKeyRowList(
            Connection conn, String sql, String keyField, String valueField, Object... args)
            throws SQLException {
        return selectKeyRowArray(conn, sql, keyField, valueField, args);
    }

    public Map<String, Object> selectKeyRowList(
            String sql, String keyField, String valueField, Object... args) throws SQLException {
        return selectKeyRowArray(getConnection(), sql, keyField, valueField, args);
    }

    public Map<String, String> selectKeyStringArray(
            Connection conn, String sql, String keyField, String valueField, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        Map<String, String> all = new HashMap<>();
        while (rs.next()) {
            all.put(rs.getString(keyField), rs.getString(valueField));
        }
        rs.close();
        return all;
    }

    public Map<String, String> selectKeyStringArray(
            String sql, String keyField, String valueField, Object[] args) throws SQLException {
        return selectKeyStringArray(getConnection(), sql, keyField, valueField, args);
    }

    public Map<String, String> selectKeyStringList(
            Connection conn, String sql, String keyField, String valueField, Object... args)
            throws SQLException {
        return selectKeyStringArray(conn, sql, keyField, valueField, args);
    }

    public Map<String, String> selectKeyStringList(
            String sql, String keyField, String valueField, Object... args) throws SQLException {
        return selectKeyStringArray(getConnection(), sql, keyField, valueField, args);
    }

    public Map<String, Map<String, Object>> selectKeyAllArray(
            Connection conn, String sql, String keyField, Object[] args) throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        ResultSetMetaData rsm = rs.getMetaData();
        Map<String, Map<String, Object>> all = new HashMap<>();
        int cnt = rsm.getColumnCount();
        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            for (int i = 1; i <= cnt; i++) row.put(rsm.getColumnLabel(i), rs.getObject(i));
            all.put((String) row.get(keyField), row);
        }
        rs.close();
        return all;
    }

    public Map<String, Map<String, Object>> selectKeyAllArray(
            String sql, String keyField, Object[] args) throws SQLException {
        return selectKeyAllArray(getConnection(), sql, keyField, args);
    }

    public Map<String, Map<String, Object>> selectKeyAllList(
            Connection conn, String sql, String keyField, Object... args) throws SQLException {
        return selectKeyAllArray(conn, sql, keyField, args);
    }

    public Map<String, Map<String, Object>> selectKeyAllList(
            String sql, String keyField, Object... args) throws SQLException {
        return selectKeyAllArray(getConnection(), sql, keyField, args);
    }

    public List<List<Object>> selectListAllArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        int cnt = rs.getMetaData().getColumnCount();
        List<List<Object>> all = new ArrayList<>();
        while (rs.next()) {
            List<Object> row = new ArrayList<>();
            for (int i = 1; i <= cnt; i++) row.add(rs.getObject(i));
            all.add(row);
        }
        rs.close();
        return all;
    }

    public List<List<Object>> selectListAllArray(String sql, Object[] args) throws SQLException {
        return selectListAllArray(getConnection(), sql, args);
    }

    public List<List<Object>> selectListAllList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectListAllArray(conn, sql, args);
    }

    public List<List<Object>> selectListAllList(String sql, Object... args) throws SQLException {
        return selectListAllArray(getConnection(), sql, args);
    }

    public List<Map<String, Object>> selectMapAllArray(Connection conn, String sql, Object[] args)
            throws SQLException {
        ResultSet rs = queryArray(conn, sql, args);
        ResultSetMetaData rsm = rs.getMetaData();
        List<Map<String, Object>> all = new ArrayList<>();
        int cnt = rsm.getColumnCount();
        while (rs.next()) {
            Map<String, Object> row = new HashMap<>();
            for (int i = 1; i <= cnt; i++) row.put(rsm.getColumnLabel(i), rs.getObject(i));
            all.add(row);
        }
        rs.close();
        return all;
    }

    public List<Map<String, Object>> selectMapAllArray(String sql, Object[] args)
            throws SQLException {
        return selectMapAllArray(getConnection(), sql, args);
    }

    public List<Map<String, Object>> selectMapAllList(Connection conn, String sql, Object... args)
            throws SQLException {
        return selectMapAllArray(conn, sql, args);
    }

    public List<Map<String, Object>> selectMapAllList(String sql, Object... args)
            throws SQLException {
        return selectMapAllArray(getConnection(), sql, args);
    }

    public int executeArray(Connection conn, String sql, Object[] args) throws SQLException {
        PreparedStatement st = conn.prepareStatement(sql);
        bindParameterArray(st, args);
        int rc = st.executeUpdate();
        st.close();
        return rc;
    }

    public int executeArray(String sql, Object[] args) throws SQLException {
        return executeArray(getConnection(), sql, args);
    }

    public int executeList(Connection conn, String sql, Object... args) throws SQLException {
        return executeArray(conn, sql, args);
    }

    public int executeList(String sql, Object... args) throws SQLException {
        return executeArray(getConnection(), sql, args);
    }

    public String getSeq(Connection conn, String seqName, int seqLen) throws SQLException {
        String seqNo;
        String sql = "{ ? = call get_seq(?, ?) }";
        CallableStatement st = buildCall(sql);
        st.registerOutParameter(1, Types.VARCHAR);
        st.setString(2, seqName);
        st.setInt(3, seqLen);
        st.execute();
        seqNo = st.getString(1);
        st.close();
        return seqNo;
    }

    public String getSeq(String seqName, int seqLen) throws SQLException {
        return getSeq(getConnection(), seqName, seqLen);
    }
}
