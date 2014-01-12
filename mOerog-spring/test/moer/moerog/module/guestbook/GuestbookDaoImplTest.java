package moer.moerog.module.guestbook;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;
import moer.moerog.config.AppConfig;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes=AppConfig.class, loader=AnnotationConfigContextLoader.class)
public class GuestbookDaoImplTest {
	@Autowired GuestbookRepository guestbookRepository;
	
	@Test
	public void create() throws Exception {
		assertThat(guestbookRepository, is(notNullValue()));
	}
	
	@Test
	public void add() throws Exception {
		guestbookRepository.deleteAll();
		assertThat(guestbookRepository.count(), is(0L));
		
		Guestbook gbook = new Guestbook();
		gbook.setWriter("admin");
		gbook.setContent("test contents....");
		guestbookRepository.save(gbook);
		
		assertThat(guestbookRepository.count(), is(1L));
	}
}
