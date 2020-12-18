package com.web.pet.util;

import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.StringUtils;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Objects;

@Slf4j
public class FileUtils {

    public static String sepSymbol = "/";

    public static boolean mkdir(String path) {
        if (path == null) return false;
        File file = new File(path);
        if (!file.exists()) {
            return file.mkdirs();
        }
        return false;
    }

    public static String fileToBase64(String path) throws IOException {
        byte[] input_file = Files.readAllBytes(Paths.get(path));
        byte[] encodedBytes = Base64.getEncoder().encode(input_file);
        return new String(encodedBytes);
    }

    public static void base64ToFile(String base64, String filePath) throws IOException {
        byte[] output_file = decodeB64(base64);
        mkdir(new File(filePath).getParent());
        org.apache.commons.io.FileUtils.writeByteArrayToFile(new File(filePath), output_file);
    }

    /**
     * 取得 base64檔案大小
     *
     * @param base64 檔案base64格式
     * @return 回傳檔案大小 (單位 KB)
     */
    public static String base64FileSize(String base64) {
        long padding;
        int totalLength = base64.length();
        if (!StringUtils.isNotBlank(base64)) {
            return "0";
        }
        if (base64.substring(totalLength - 1).equals("=")) {
            if (base64.substring(totalLength - 2, totalLength - 1).equals("=")) {
                padding = 2;
            } else {
                padding = 1;
            }
        } else {
            padding = 0;
        }
        // 四捨五入到第二位
        double size =
                Math.round(((((double) (totalLength) * (3.0 / 4.0)) - padding) / 1024) * 100)
                        / 100.0;
        return String.valueOf(size);
    }

    /**
     * 解碼 Base64 內容
     *
     * @param strContent 編譯過的內容字串
     * @return 解碼的二進內容
     */
    public static byte[] decodeB64(String strContent) {
        if (strContent.startsWith("data:application/octet-stream;base64,")) {
            return Base64.getDecoder().decode(strContent.split(",")[1]);
        } else {
            return Base64.getDecoder().decode(strContent);
        }
    }

    /**
     * 搬移檔案
     *
     * @param from 起始路徑
     * @param to 搬移路徑
     * @return 成功與否
     */
    public static boolean moveFile(String from, String to) {
        File file = new File(from);
        File targetFile = new File(to);
        if (!targetFile.getParentFile().exists()) {
            targetFile.getParentFile().mkdirs();
        }
        return file.renameTo(targetFile);
    }

    /**
     * 搬移檔案
     *
     * @param file 要搬移的檔案
     * @param to 搬移路徑
     * @return 成功與否
     */
    public static boolean moveFile(File file, String to) {
        File targetFile = new File(to);
        if (!targetFile.getParentFile().exists()) {
            targetFile.getParentFile().mkdirs();
        }
        return file.renameTo(targetFile);
    }

    /**
     * 檢查路徑資料夾是否存在, 不存在新建
     * @param file File
     * @return 建立成功與否
     */
    public static boolean checkDir(File file) {
        if (!file.getParentFile().exists()) {
            return file.getParentFile().mkdirs();
        } else {
            return true;
        }
    }


    /**
     * 取得資料夾目錄下的全部檔案
     *
     * @param dirPath 資料夾位置
     * @return 裡面的檔案陣列
     */
    public static List<File> getDirFileList(String dirPath) {
        List<File> fileList = new ArrayList<>();
        File dirFile = new File(dirPath);
        String absolutePath = dirFile.getAbsolutePath(); // 取得絕對路徑
        if (dirFile.isDirectory()) {
            for (String fileName : Objects.requireNonNull(dirFile.list())) {
                File file = new File(absolutePath + sepSymbol + fileName);
                if (!file.isDirectory() && !file.getName().substring(0, 1).equals("."))
                    fileList.add(file);
            }
        } else {
            log.error(dirPath + "資料夾不存在");
        }
        return fileList;
    }

    /**
     * 取得資料夾目錄下的全部檔案(副檔名為指定)
     *
     * @param dirPath 資料夾位置
     * @param extension 副檔名格式
     * @return 裡面的檔案陣列
     */
    public static List<File> getDirFileList(String dirPath, String extension) {
        List<File> fileList = new ArrayList<>();
        File dirFile = new File(dirPath);
        String absolutePath = dirFile.getAbsolutePath(); // 取得絕對路徑
        if (dirFile.isDirectory()) {
            for (String fileName : Objects.requireNonNull(dirFile.list())) {
                File file = new File(absolutePath + sepSymbol + fileName);
                if (!file.isDirectory()
                        && !file.getName().startsWith(".")
                        && FilenameUtils.getExtension(file.getName()).equals(extension))
                    fileList.add(file);
            }
        } else {
            log.error(dirPath + " 資料夾不存在");
        }
        return fileList;
    }

    /**
     * 檢查資料夾路徑最後是否有斜線
     *
     * @param dirPath 資料夾路徑
     * @return 處理後的路徑
     */
    public static String checkDirPath(String dirPath) {
        if (dirPath.substring(dirPath.length() - 1).equals("\\")
                || dirPath.substring(dirPath.length() - 1).equals("/")) {
            return dirPath;
        } else return dirPath + sepSymbol;
    }

    /**
     * 檢查檔案是否存在
     *
     * @param path
     * @return
     */
    public static Boolean isExists(String path) {
        File tmp = new File(path);
        return tmp.exists();
    }

    /**
     * 修正路徑位置
     *
     * @param path 路徑
     * @return 修正後路徑
     */
    public static String fixPath(String path) {
        String fixPath = path.replace("/", sepSymbol);
        fixPath = fixPath.replace("\\", sepSymbol);
        return fixPath;
    }

    /**
     * 檢查路徑檔案是否可用
     * @param path 檔案路徑
     * @return 可否使用
     */
    public static boolean checkUse(String path) {
        File file = new File(path);
        if (!file.exists()) return false;
        if (!file.canExecute()) return false;
        if (!file.canRead()) return false;
        return file.canWrite();
    }

    /**
     * 刪除檔案
     * @param path 檔案路徑
     * @return 是否刪除成功
     */
    public static boolean deleteFile(String path) {
        File file = new File(path);
        if (!file.exists()) return false;
        if (file.isDirectory()) return false;
        return file.delete();
    }

    /**
     * 將base64轉成Byte array格式
     *
     * @param base64 檔案的base64
     * @return 檔案的byte[]
     */
    public static byte[] base64ToByteArray(String base64) {
        return Base64.getDecoder().decode(base64.getBytes());
    }

    /**
     * 判斷data是否為pdf檔案
     *
     * @param data byte[]格式的檔案
     * @return 是pdf檔案回傳true, 不是則回傳false
     */
    public static boolean isPDF(byte[] data) {
        if (data == null || data.length < 5) return false;
        // %PDF-
        if (data[0] == 0x25
                && data[1] == 0x50
                && data[2] == 0x44
                && data[3] == 0x46
                && data[4] == 0x2D) {
            int offset = data.length - 8,
                    count = 0; // check last 8 bytes for %%EOF wiisPDFth optional
            // white-space
            boolean hasSpace = false, hasCr = false, hasLf = false;
            while (offset < data.length) {
                if (count == 0 && data[offset] == 0x25) count++; // %
                if (count == 1 && data[offset] == 0x25) count++; // %
                if (count == 2 && data[offset] == 0x45) count++; // E
                if (count == 3 && data[offset] == 0x4F) count++; // O
                if (count == 4 && data[offset] == 0x46) count++; // F
                // Optional flags for meta info
                if (count == 5 && data[offset] == 0x20) hasSpace = true; // SPACE
                if (count == 5 && data[offset] == 0x0D) hasCr = true; // CR
                if (count == 5 && data[offset] == 0x0A) hasLf = true; // LF / EOL
                offset++;
            }

            if (count == 5) {
                // String version = data.length > 13 ? String.format("%s%s%s", (char) data[5],
                // (char) data[6], (char) data[7]) : "?";
                return true;
            }
        }
        return false;
    }

    /**
     * 將文字輸出檔案
     * @param dir 輸出目錄
     * @param fileName 輸出文字名稱
     * @param saveData 要儲存的檔案
     */
    public static void outputTextFile(String dir, String fileName, String saveData) {
        mkdir(checkDirPath(dir));
        File file = new File(checkDirPath(dir), fileName);
        FileOutputStream fileOutputStream;
        try {
            fileOutputStream = new FileOutputStream(file);
            OutputStreamWriter oStreamWriter = new OutputStreamWriter(fileOutputStream, StandardCharsets.UTF_8);
            oStreamWriter.append(saveData);
            oStreamWriter.close();
        } catch (IOException e) {
            log.info("文字檔輸出失敗: " + e.getMessage());
        }
    }

    /**
     * 將文字輸出檔案
     * @param dir 輸出目錄
     * @param fileName 輸出文字名稱
     * @param saveData 要儲存的檔案
     */
    public static void writeTextFile(String dir, String fileName, String saveData) {
        mkdir(checkDirPath(dir));
        File file = new File(checkDirPath(dir), fileName);
        FileOutputStream fileOutputStream;
        try {
            String oldData = FileUtils.readTextFile(new File(dir+fileName));
            fileOutputStream = new FileOutputStream(file);
            OutputStreamWriter oStreamWriter = new OutputStreamWriter(fileOutputStream, StandardCharsets.UTF_8);
            oStreamWriter.append(oldData);
            oStreamWriter.append(saveData);
            oStreamWriter.close();
        } catch (IOException e) {
            log.info("文字檔輸出失敗: " + e.getMessage());
        }
    }

    /**
     * 讀取文字檔
     * @param filePath 檔案路徑
     * @return 讀取資料
     */
    public static String readTextFile(String filePath) {
        File file = new File(filePath);

        if (!file.exists() || file.isDirectory())
            return "";

        StringBuilder contentBuilder = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            String sCurrentLine;
            while ((sCurrentLine = br.readLine()) != null) {
                contentBuilder.append(sCurrentLine);
            }
        } catch (IOException e) {
            log.info("找不到文字檔: " + e.getMessage());
        }
        return contentBuilder.toString();
    }

    /**
     * 讀取文字檔
     * @param file 檔案
     * @return 讀取資料
     */
    public static String readTextFile(File file) {

        if (!file.exists() || file.isDirectory())
            return "";

        StringBuilder contentBuilder = new StringBuilder();
        try (BufferedReader br = new BufferedReader(new FileReader(file.getPath()))) {
            String sCurrentLine;
            while ((sCurrentLine = br.readLine()) != null) {
                contentBuilder.append(sCurrentLine);
            }
        } catch (IOException e) {
            log.info("找不到文字檔: " + e.getMessage());
        }
        return contentBuilder.toString();
    }

    /**
     * 取得檔案副檔名
     * @param fullFileName 檔案全名
     * @return 副檔名
     */
    public static String getExtension(String fullFileName) {
        return fullFileName.substring(fullFileName.lastIndexOf("."));
    }

    /**
     * 輸出檔案
     * @param byteData byteData
     * @param outputPath 輸出路徑
     * @throws IOException 錯誤
     */
    public static void outputFile(byte[] byteData, String outputPath) throws IOException {
        checkDir(new File(outputPath));
        FileOutputStream outputStream  = new FileOutputStream(new File(outputPath));
        outputStream.write(byteData);
        outputStream.close();
    }


}
