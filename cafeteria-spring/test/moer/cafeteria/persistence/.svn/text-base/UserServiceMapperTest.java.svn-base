package moer.cafeteria.persistence;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.assertThat;
import moer.cafeteria.user.User;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class UserServiceMapperTest {
	@Autowired UserServiceMapper userServiceMapper;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	User testUser = new User();
	User testAdmin = new User();
	
	@Before
	public void setUp() {
		testUser.setId("20046326");
		testUser.setPw("test");
		testUser.setName("최윤석");
		testUser.setDepartment("정보통신학부");
		testUser.setType("USER");
		
		testAdmin.setId("bonbu");
		testAdmin.setPw("test");
		testAdmin.setName("김운영");
		testAdmin.setDepartment("본부동");
		testAdmin.setType("ADMIN");
	}
	
	@Test
	public void create() throws Exception {
		assertThat(userServiceMapper, is(notNullValue(UserServiceMapper.class)));
	}
	
	@Test
	public void getUser() throws Exception {
		logger.info(testUser.toString());
		User user = userServiceMapper.getUser(testUser);
		logger.info(user.toString());
		checkSameUser(testUser, user);
		
		User admin = userServiceMapper.getUser(testAdmin);
		checkSameUser(testAdmin, admin);
	}

	private void checkSameUser(User testUser, User user) {
		assertThat(testUser.getId(), is(user.getId()));
		assertThat(testUser.getName(), is(user.getName()));
		assertThat(testUser.getDepartment(), is(user.getDepartment()));
		assertThat(testUser.getType(), is(user.getType()));
	}
}