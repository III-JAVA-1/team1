package util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class PetListener
 *
 */
@WebListener
public class PetListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public PetListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	System.out.println("少女毀滅中===================");
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	System.out.println("少女祈禱中===================");
    	HibernateUtils.getSessionFactory();
    	System.out.println("少女祈禱完畢===================");
    	
    }
	
}
