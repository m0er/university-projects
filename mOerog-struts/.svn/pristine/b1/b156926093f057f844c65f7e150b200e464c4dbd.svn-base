package com.moerog.test;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.TestCase;

import org.apache.log4j.Logger;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;
import com.moerog.comment.CommentVO;
import com.moerog.guestbook.GuestBookVO;
import com.moerog.post.PostVO;
import com.moerog.user.UserVO;
import com.moerog.util.DesEncrypter;

public class IbatisTest extends TestCase {
	private SqlMapClient client;
	private Logger logger = Logger.getLogger(IbatisTest.class);
	
	@Override
	protected void setUp() throws Exception {
		super.setUp();
		String resource = "com/moerog/config/sqlConfig.xml";
		Reader reader = Resources.getResourceAsReader(resource);
		client = SqlMapClientBuilder.buildSqlMapClient(reader);
	}
	
	public void testTime() throws Exception {
		String result = (String)client.queryForObject("test.getTime");
		logger.info(result);
	}
	
	public void testRegisterUser() throws Exception {
		UserVO vo = new UserVO();
		vo.setUserEmail("moerog@user2.com");
		vo.setUserId("moerog2");
		vo.setUserNickname("moer2");
		String pword = "asdf";
		pword = DesEncrypter.encrypt(pword);
		vo.setUserPword(pword);
		
		client.insert("user.register", vo);
	}
	
	public void testGetUser() throws Exception {
		UserVO vo = new UserVO();
		String id = "moerog2";
		vo = (UserVO)client.queryForObject("user.getUser", id);
		
		logger.info(vo.getUserEmail());
		logger.info(vo.getUserId());
		logger.info(vo.getUserNickname());
		logger.info(DesEncrypter.decrypt(vo.getUserPword()));
	}
	
	public void testAddGbook() throws Exception {
		GuestBookVO vo = new GuestBookVO();
		//vo.setGbookContent("방명록 테스트");
		vo.setWriter("mOer");
		
		client.insert("gbook.add", vo);
	}
	
	@SuppressWarnings("unchecked")
	public void testListGbook() throws Exception {
		List<GuestBookVO>list = client.queryForList("gbook.list");
		
		for (GuestBookVO vo : list) {
			logger.info(vo.getGbookContent());
		}
	}
	
	public void testCountGbook() throws Exception {
		long count = (Long)client.queryForObject("gbook.count");
		logger.info("record count: " + count);
	}
	
	@SuppressWarnings("unchecked")
	public void testDeleteGbook() throws Exception {				
		long count = 6;
		Map map = new HashMap();
		map.put("gbookId", count);
		map.put("writer", "moer2");
		client.delete("gbook.delete", map);
	}
	
	public void testGetAdmin() throws Exception {		
		UserVO vo = (UserVO)client.queryForObject("user.getAdmin", "admin");
		assertNotNull("Admin 객체", vo);
	}
	
	public void testAddPost() throws Exception {
		PostVO vo = new PostVO();
		vo.setAdminNickname("mOer");
		vo.setPostCategory(1);
		vo.setPostTitle("테스트 포스트");
		vo.setPostContent("Lorem ipsum dolor");
		
		client.insert("post.add", vo);
	}
	
	@SuppressWarnings("unchecked")
	public void testPosts() throws Exception {
		List<PostVO> list = client.queryForList("post.list", 1);
		
		for (PostVO vo : list) {
			logger.info(vo.getPostId());
			logger.info(vo.getPostCategory());
			logger.info(vo.getPostDatetime());
			logger.info(vo.getPostTitle());
			logger.info(vo.getPostContent());
			logger.info(vo.getAdminNickname());
		}
	}
	
	public void testCountingPosts() throws Exception {
		long result = (Long)client.queryForObject("post.totalCount");
		logger.info("포스트 개수: " + result);
	}
	
	@SuppressWarnings("unchecked")
	public void testDeletePost() throws Exception {
		Map map = new HashMap();
		map.put("postId", 5L);
		map.put("postCategory", 1);
		map.put("adminNickname", "mOer");
		
		client.delete("post.delete", map);
	}
	
	public void testModifyPost() throws Exception {
		PostVO vo = new PostVO();
		vo.setAdminNickname("mOer");
		vo.setPostCategory(2);
		vo.setPostId(27L);
		vo.setPostTitle("수정된 포스트");
		vo.setPostContent("수정된 포스트");
		
		client.update("post.modify", vo);
	}
	
	public void testGetPost() throws Exception {
		PostVO vo = new PostVO();
		vo.setAdminNickname("mOer");
		vo.setPostCategory(2);
		vo.setPostId(27L);		
		vo = (PostVO)client.queryForObject("post.getPost", vo);
		
		logger.info(vo.getPostTitle());
		logger.info(vo.getPostContent());
	}
	
	public void testAddComment() throws Exception {
		CommentVO vo = new CommentVO();
		vo.setPostId(50L);
		vo.setWriter("mOer");
		vo.setCommentContent("커멘트 테스트");
		
		client.insert("comment.add", vo);
	}
	
	public void testDummyComment() throws Exception {
		for (int i=0; i<10; i++) {
			testAddComment();
		}
	}
	
	@SuppressWarnings("unchecked")
	public void testListComment() throws Exception {
		List<CommentVO> list = client.queryForList("comment.list", 50L);
		
		for (CommentVO vo : list) {
			logger.info(vo.getPostId());
			logger.info(vo.getCommentContent());
		}
	}
	
	@SuppressWarnings("unchecked")
	public void testDeleteComment() throws Exception {
		Map map = new HashMap();
		map.put("postId", 50L);
		map.put("commentId", 11L);
		map.put("writer", "mOer");
		
		client.delete("comment.delete", map);
	}
	
}
