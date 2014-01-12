package moer.meetup.persistence;

import static org.junit.Assert.*;

import org.junit.*;
import org.junit.runner.*;
import org.mybatis.spring.*;
import org.mybatis.spring.support.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/applicationContext-test.xml"})
public class MyBatisMapperTest extends SqlSessionDaoSupport {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Test
	public void now() throws Exception {
		String now = (String) getSqlSession().selectOne("test.getNow");
		logger.info(now);
	}
}
