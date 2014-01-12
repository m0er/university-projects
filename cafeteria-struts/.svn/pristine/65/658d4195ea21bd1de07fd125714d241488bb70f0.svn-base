package kr.ac.bu.test;

import java.io.File;

import kr.ac.bu.index.IndexVO;

import org.apache.log4j.Logger;

import servletunit.struts.MockStrutsTestCase;

public class ActionServletTest extends MockStrutsTestCase {
	private static Logger logger = Logger.getLogger(ActionServletTest.class);
	
	@Override
	protected void setUp() throws Exception {
		super.setUp();
		this.setContextDirectory(new File("WebContent"));
		this.setConfigFile("/WEB-INF/struts-config.xml");		
	}
	
	public void testIndex() throws Exception {
		this.setRequestPathInfo("/index");
		this.actionPerform();
		logger.info(this.getActualForward());
	}	
	
	public void testUserLogin() throws Exception {
		this.setRequestPathInfo("/index");
		this.addRequestParameter("userLogin", "");
		this.addRequestParameter("id", "20046326");
		this.addRequestParameter("pw", "test");
		
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testAdminLogin() throws Exception {
		this.setRequestPathInfo("/index");
		this.addRequestParameter("adminLogin", "");
		this.addRequestParameter("id", "admin1");
		this.addRequestParameter("pw", "test");
		
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testBuilding() throws Exception {
		IndexVO vo = new IndexVO();
		vo.setId("20046326");
		this.getRequest().getSession().setAttribute("user", vo);
		this.addRequestParameter("building", "bonbu");
		this.setRequestPathInfo("/index");
		
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testPlex() throws Exception {
		IndexVO vo = new IndexVO();
		vo.setId("20046326");
		this.getRequest().getSession().setAttribute("user", vo);
		this.getRequest().getSession().setAttribute("building", "bonbu");
		this.setRequestPathInfo("/plex");
		
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testRegisterMenu() throws Exception {
		this.setRequestPathInfo("/plex");
		this.addRequestParameter("title", "메뉴 테스트1");
		this.addRequestParameter("price", "2000");
		this.addRequestParameter("provideDateAlt", "2010-05-16");
		this.addRequestParameter("building", "본부동");
		
		this.addRequestParameter("registerMenu", "");
		
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testLogout() throws Exception {
		this.setRequestPathInfo("/index");
		IndexVO vo = new IndexVO();
		vo.setId("20046326");
		this.getRequest().getSession().setAttribute("user", vo);
		this.addRequestParameter("logout", "");
		
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testSearchMenu() throws Exception {
		this.setRequestPathInfo("/plex");
		this.addRequestParameter("searchDate", "2010-05-16");
		
		this.addRequestParameter("searchMenu", "");		
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
}
