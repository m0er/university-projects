package com.moerog.test;

import java.io.File;

import org.apache.log4j.Logger;

import servletunit.struts.MockStrutsTestCase;

import com.moerog.user.UserVO;
import com.moerog.util.DesEncrypter;

public class ActionServletTest extends MockStrutsTestCase {
	private static Logger logger = Logger.getLogger(ActionServletTest.class);
	
	@Override
	protected void setUp() throws Exception {
		super.setUp();
		this.setContextDirectory(new File("WebContent"));
		this.setConfigFile("/WEB-INF/struts-config.xml");
		/*
		 * ServletContextListener는 Mock에서 사용할 수 없기 때문에,
		 * key.ser 경로를 잡아줘야 한다.
		 */
		DesEncrypter.init("WebContent/WEB-INF/key.ser");
	}
	
	public void testGuestbook() throws Exception {
		this.setRequestPathInfo("/guestbook");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testUserAction() throws Exception {
		this.setRequestPathInfo("/user");
		this.addRequestParameter("login", "");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testUserLogin() throws Exception {
		this.setRequestPathInfo("/user");
		this.addRequestParameter("userId", "foo1234");
		this.addRequestParameter("userPword", "bar1234");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testAdminLogin() throws Exception {
		this.setRequestPathInfo("/user");
		this.addRequestParameter("adminLogin", "");
		this.addRequestParameter("userId", "admin");
		this.addRequestParameter("userPword", "cookie");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testUserLogout() throws Exception {
		testUserLogin();
		assertNotNull("로그인 했으므로, UserVO 객체가 존재해야함",
				request.getSession().getAttribute("user"));
		this.setRequestPathInfo("/user");
		this.addRequestParameter("logout", "");
		this.actionPerform();
		assertNull("로그아웃 했으므로, UserVO 객체가 없어야 함.",
				request.getSession().getAttribute("user"));
	}
	
	public void testUserRegister() throws Exception {
		this.setRequestPathInfo("/user");
		this.addRequestParameter("register", ""); // call register()
		this.addRequestParameter("userId", "foo1234");
		this.addRequestParameter("userPword", "bar1234");
		this.addRequestParameter("userEmail", "foobar1234@bar.com");
		this.addRequestParameter("userNickname", "foobar1234");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
			
	public void testGbookList() throws Exception {
		this.setRequestPathInfo("/guestbook");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testGbookAdd() throws Exception {
		this.setRequestPathInfo("/guestbook");
		this.addRequestParameter("add", "");
		this.addRequestParameter("gbookContent", "한글도 OK!!!");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testGbookDelete() throws Exception {
		this.setRequestPathInfo("/guestbook");
		this.addRequestParameter("delete", "");
		this.addRequestParameter("gbookId", "8");
		UserVO vo = new UserVO();
		vo.setUserNickname("moer2");
		this.request.getSession().setAttribute("user", vo);
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testPostList() throws Exception {
		this.setRequestPathInfo("/post");
		this.addRequestParameter("category", "esl");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testPostList2() throws Exception {
		this.setRequestPathInfo("/post");
		this.request.getSession().setAttribute("category", "clanbase");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testIndexPostList() throws Exception {
		this.setRequestPathInfo("/index");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testPostInsert() throws Exception {
		this.setRequestPathInfo("/post");
		//this.addRequestParameter("category", "esl");
		this.addRequestParameter("add", "");
		this.addRequestParameter("postCategory", "3");
		this.addRequestParameter("postTitle", "포스트 작성 테스트");
		this.addRequestParameter("postContent", "컨텐츠.. 컨텐츠");
		this.addRequestParameter("adminNickname", "mOer");
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testDummyPostInput() throws Exception {
		for (int i=0; i<10; i++) {
			testPostInsert();
		}
	}
	
	public void testPostDelete() throws Exception {
		this.request.getSession().setAttribute("category", "esl");
		this.request.setHeader("host", "localhost:7777");
		this.request.setHeader("referer", "http://localhost:7777/mOerog/post.do");
		this.setRequestPathInfo("/post");
		this.addRequestParameter("delete", "");
		this.addRequestParameter("postId", "41");
		this.addRequestParameter("postCategory", "1");
		this.addRequestParameter("adminNickname", "mOer");
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testWritePost() throws Exception {
		this.setRequestPathInfo("/post");
		this.addRequestParameter("write", "");
		this.actionPerform();
		logger.info(this.getActualForward());
	}
	
	public void testModifyPost() throws Exception {
		this.request.getSession().setAttribute("category", "esl");
		this.request.setHeader("host", "localhost:7777");
		this.request.setHeader("referer", "http://localhost:7777/mOerog/post.do");
		this.setRequestPathInfo("/post");
		this.addRequestParameter("modify", "");
		this.addRequestParameter("postId", "27");
		this.addRequestParameter("postCategory", "2");
		this.addRequestParameter("postTitle", "수정된 포스트2");
		this.addRequestParameter("postContent", "수정된 포스트2");
		this.addRequestParameter("adminNickname", "mOer");
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testChangePost() throws Exception {
		this.setRequestPathInfo("/post");
		this.addRequestParameter("change", "");
		this.addRequestParameter("postId", "27");
		this.addRequestParameter("postCategory", "2");
		this.addRequestParameter("adminNickname", "mOer");
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testListComment() throws Exception {
		this.setRequestPathInfo("/comment");
		this.addRequestParameter("postId", "50");
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testAddComment() throws Exception {
		this.setRequestPathInfo("/comment");
		this.addRequestParameter("add", "");
		this.addRequestParameter("commentContent", "커멘트 등록 테스트");
		this.addRequestParameter("postId", "50");
		this.addRequestParameter("writer", "mOer");
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
	
	public void testDelComment() throws Exception {
		this.setRequestPathInfo("/comment");
		this.addRequestParameter("delete", "");
		this.addRequestParameter("postId", "50");
		this.addRequestParameter("commentId", "13");
		this.addRequestParameter("writer", "mOer");
		this.actionPerform();
		
		logger.info(this.getActualForward());
	}
}
