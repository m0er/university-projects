package moer.meetup.start;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;
import moer.meetup.persistence.TestMapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class MyBatisTest {
	@Autowired TestMapper testMapper;
	Logger logger = LoggerFactory.getLogger(MyBatisTest.class);
	
	@Test
	public void create() throws Exception {
		assertThat(testMapper, is(notNullValue()));
	}
	
	@Test
	public void currentTime() throws Exception {
		assertThat(testMapper.getTime(), is(notNullValue(String.class)));
	}
}
