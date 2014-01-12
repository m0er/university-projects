package moer.moerog.module.user;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;
import moer.moerog.config.AppConfig;

import org.bson.types.ObjectId;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=AppConfig.class, loader=AnnotationConfigContextLoader.class)
public class UserRepositoryTest {
	@Autowired UserRepository userRepository;
	
	@Before
	public void setUp() {
		userRepository.deleteAll();
		
		User admin = new User();
		admin.setAdmin(true);
		admin.setUserId("admin");
		admin.setNickname("mOer");
		admin.setPassword("test");
		
		userRepository.save(admin);
	}
	
	@Test
	public void create() throws Exception {
		assertThat(userRepository, is(notNullValue()));
	}
	
	@Test
	public void findAdminById_어드민_찾기() {
		User user = userRepository.findByUserId("admin");
		
		assertThat(user.getId(), is(notNullValue(ObjectId.class)));
		assertThat(user.getNickname(), is("mOer"));
		assertThat(user.getPassword(), is("test"));
	}
	
	@Test
	public void registerUserAndGet() throws Exception {
		userRepository.deleteAll();
		
		User user1 = new User();
		user1.setUserId("testUser");
		user1.setPassword("testUser");
		user1.setEmail("testUser@testUser.com");
		user1.setNickname("testUser");
		
		userRepository.save(user1);

		User user2 = userRepository.findOne(user1.getId());
		assertThat(user1.getId(), is(user2.getId()));
		assertThat(user1.getEmail(), is(user2.getEmail()));
	}

}
