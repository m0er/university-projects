package moer.cafeteria.persistence;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.junit.Assert.*;

import java.util.*;

import moer.cafeteria.reservation.*;

import org.junit.*;
import org.junit.runner.*;
import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.test.context.*;
import org.springframework.test.context.junit4.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class ReservationGroovyMapperTest {
	@Autowired ReservationGroovyMapper reservationMapper;
	@Autowired RateGroovyMapper rateGroovyMapper;
	Logger logger = LoggerFactory.getLogger(getClass());
	Menu menu1 = new Menu();
	Menu menu2 = new Menu();
	static final Date TODAY = new Date();
	
	@Before
	public void setUp() {
		menu1.setBuilding("bonbu");
		menu1.setPrice(2500);
		menu1.setTitle("돈까스");
		menu1.setProvide(TODAY);
		
		menu2.setBuilding("bonbu");
		menu2.setPrice(3000);
		menu2.setTitle("왕돈까스");
		menu2.setProvide(TODAY);
	}
	
	@Test
	public void create() throws Exception {
		assertThat(reservationMapper, is(notNullValue(ReservationGroovyMapper.class)));
	}
	
	@Test
	public void insertMenu() throws Exception {
		reservationMapper.deleteAllReservation();
		reservationMapper.deleteAllMenu();
		assertThat(reservationMapper.countMenu(), is(0));
		
		reservationMapper.insertMenu(menu1);
		assertThat(reservationMapper.countMenu(), is(1));
		
		Menu selectedMenu = reservationMapper.getMenu(menu1);
		logger.info(selectedMenu.toString());
		
		assertThat(menu1.getBuilding(), is(selectedMenu.getBuilding()));
		assertThat(menu1.getPrice(), is(selectedMenu.getPrice()));
		assertThat(menu1.getTitle(), is(selectedMenu.getTitle()));
		assertThat(menu1.getProvide(), is(selectedMenu.getProvide()));
	}
	
	@Test
	public void getMenu() throws Exception {
		reservationMapper.deleteAllReservation();
		reservationMapper.deleteAllMenu();
		reservationMapper.insertMenu(menu1);
		reservationMapper.insertMenu(menu2);
		
		Menu menu = new Menu();
		menu.setProvide(new Date());
		menu.setBuilding("bonbu");
		
		List<Menu> menuList = reservationMapper.getMenuList(menu);
		assertThat(menuList.size(), is(2));
	}
	
	@Test
	public void insertReservationAndConfirm() throws Exception {
		rateGroovyMapper.deleteAllRate();
		reservationMapper.deleteAllReservation();
		reservationMapper.deleteAllMenu();
		
		reservationMapper.insertMenu(menu1);
		Menu targetMenu = reservationMapper.getMenu(menu1);
		logger.info(targetMenu.toString());
		
		Reservation reservation = new Reservation();
		reservation.setClientId("20046326");
		reservation.setMenuId(targetMenu.getId());
		reservation.setReserveDate(TODAY);
		reservation.setType("NORMAL");
		reservation.setBuilding(targetMenu.getBuilding());
		reservationMapper.insertReservation(reservation);
		assertThat(reservationMapper.countReservationByBuilding(reservation.getBuilding()), is(1));
		
		Reservation reservationForFindReservation = new Reservation();
		reservationForFindReservation.setBuilding(reservation.getBuilding());
		reservationForFindReservation.setReserveDate(TODAY);
		logger.info(reservationForFindReservation.toString());
		
		List<Reservation> reservationList = reservationMapper.getReservationList(reservationForFindReservation);
		assertThat(reservationList.size(), is(1));
		logger.info(reservationList.toString());
		
		for (Reservation reserved : reservationList)
			reservationMapper.deleteReservation(reserved.getId());
		assertThat(reservationMapper.countReservationByBuilding(reservation.getBuilding()), is(0));
	}
	
}
