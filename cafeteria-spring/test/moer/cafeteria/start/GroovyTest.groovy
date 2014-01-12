package moer.cafeteria.start

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;

import org.junit.*;
import org.slf4j.*;

class GroovyTest {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	def salute() {
		"Hello, World!!";
	}
	
	@Test
	public void groovyTest() throws Exception {
		assertThat(salute(), is(containsString("Hello")))
	}
}
