package kr.ac.bu.test;

import java.io.Reader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import junit.framework.TestCase;
import kr.ac.bu.index.IndexVO;
import kr.ac.bu.plex.MenuVO;
import kr.ac.bu.plex.ReservationVO;

import org.apache.log4j.Logger;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

public class PersistenceTest extends TestCase {
	private SqlMapClient client;
	private Logger logger = Logger.getLogger(PersistenceTest.class);		
	
	protected void setUp() throws Exception {
		super.setUp();
		String resource = "kr/ac/bu/config/sqlConfig.xml";
		Reader reader = Resources.getResourceAsReader(resource);
		client = SqlMapClientBuilder.buildSqlMapClient(reader);		
	}
	
	@SuppressWarnings("unchecked")
	public void testGetClients() throws Exception {
		List<IndexVO> vos = client.queryForList("index.getClients");
		
		for (IndexVO vo : vos) {
			logger.info(vo.getId());
			logger.info(vo.getName());
			logger.info(vo.getType());
		}
	}
	
	public void testGetUser() throws Exception {
		IndexVO vo = new IndexVO();
		vo.setId("20046326");
		vo.setPw("test");
		vo.setType("USER");
		
		vo = (IndexVO)client.queryForObject("index.getClient", vo);
		
		logger.info(vo.getName());
	}
	
	public void testGetAdmin() throws Exception {
		IndexVO vo = new IndexVO();
		vo.setId("admin1");
		vo.setPw("test");
		vo.setType("ADMIN");
		
		vo = (IndexVO)client.queryForObject("index.getClient", vo);
		
		logger.info(vo.getName());
	}
	
	public void testSetMenu() throws Exception {
		MenuVO vo = new MenuVO();
		vo.setBuilding("본부동");
		vo.setPrice(2200);
		vo.setTitle("우동");
		
		//Calendar cal = Calendar.getInstance();
		//cal.set(2010, 4, 25); // 5월 25일
		//DateFormat form = new SimpleDateFormat("yyyy-MM-dd");
		//form.setCalendar(cal);
		
		//vo.setProvideDate(cal.getTime());
		
		//vo.setProvideDate(vo.provideDateParse("2010-05-16"));
		logger.info(vo.getProvideDate());
		
		client.insert("plex.setMenu", vo);
	}
	
	public void testDate() throws Exception {
		Date date = new Date();
		logger.info(date);
		
		Calendar cal = Calendar.getInstance();
		cal.set(2010, 5, 25);
		logger.info(cal.getTime());
	}
	
	@SuppressWarnings("unchecked")
	public void testGetMenu() throws Exception {
		Calendar cal = Calendar.getInstance();
		cal.set(2010, 4, 21); // 5월 21일
		DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String searchDate = formatter.format(cal.getTime());
		
		logger.info(searchDate);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchDate", searchDate);
		map.put("building", "교수회관");		
		
		List<MenuVO> vos = client.queryForList("plex.getMenu", map);
		
		for (MenuVO vo : vos) {
			logger.info(vo.getTitle());
			logger.info(vo.getProvideDate());
		}
	}
	
	public void testSetTimeTable() throws Exception {
		TestVO vo = new TestVO();
		vo.setDate(new Date());
		vo.setDateTime(new Date());
		client.insert("test.setTime", vo);
	}
	
	@SuppressWarnings("unchecked")
	public void testGetTimeTable() throws Exception {
		List<TestVO> vos = new ArrayList<TestVO>();
		vos = client.queryForList("test.getTime");
		
		logger.info(vos);
		
		for (TestVO vo : vos) {
			logger.info(vo.getDate());
			logger.info(vo.getDateTime());
		}
	}
	
	@SuppressWarnings("unchecked")
	public void testGetReservations() throws Exception {
		List<ReservationVO> vos = new ArrayList<ReservationVO>();
		Map<String, String> maps = new HashMap<String, String>();
		maps.put("reserveDate", "2010-05-08");
		maps.put("building", "본부동");
		
		vos = client.queryForList("plex.getReservations", maps);
		
		logger.info(vos);
		
		for (ReservationVO vo : vos) {
			logger.info(vo.getId());
			logger.info(vo.getClientID());
			logger.info(vo.getDepartment());
			logger.info(vo.getName());
			logger.info(vo.getReserveDate());
			logger.info(vo.getTitle());
			logger.info(vo.getType());
		}
	}
	
	public void setReservation() throws Exception {
		
	}
}
