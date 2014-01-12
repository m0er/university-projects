package com.moerog.config;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.moerog.util.DesEncrypter;

/**
 * Application Lifecycle Listener implementation class InitServlet
 *
 */
public class ActionListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ActionListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent sce) {
        String filePath = sce.getServletContext().getInitParameter("keyFile");
        String realPath = sce.getServletContext().getRealPath(filePath);
        System.out.println(realPath);
        DesEncrypter.init(realPath);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
