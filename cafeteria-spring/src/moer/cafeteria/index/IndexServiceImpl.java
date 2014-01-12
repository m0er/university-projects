package moer.cafeteria.index;

import java.util.Date;
import java.util.List;

import moer.cafeteria.persistence.RateGroovyMapper;
import moer.cafeteria.persistence.ReservationGroovyMapper;
import moer.cafeteria.persistence.UserServiceMapper;
import moer.cafeteria.rate.Rate;
import moer.cafeteria.reservation.Menu;
import moer.cafeteria.reservation.Reservation;
import moer.cafeteria.user.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("indexService")
public class IndexServiceImpl implements IndexService {
	@Autowired ReservationGroovyMapper reservationGroovyMapper;
	@Autowired UserServiceMapper userServiceMapper;
	@Autowired RateGroovyMapper rateGroovyMapper;
	
	final String[] menuTitles = {"비빔밥", "자장면", "치즈라면", "백반"};
	final int[] menuPrices = {2500, 3300, 2200, 2600};
	final String[] comments = {"먹을만 하네요", "엄청 맛있어요!", "최고네요 :-)", "느끼해요 :-(", "이건 좀 아닌듯", "괜찮아요~"};
	
	@Override
	public void addDummyData() {
		final List<User> userList = userServiceMapper.getUserList();
		addDummyMenuData();
		
		List<Menu> menuList = reservationGroovyMapper.getMenuList(createDummyMenu());
		addDummyReservation(userList, menuList);
		addDummyRate(userList, menuList);
	}

	private void addDummyRate(final List<User> userList, List<Menu> menuList) {
		Rate dummyRate = new Rate();
		for (User user : userList) {
			dummyRate.setUserId(user.getId());
			dummyRate.setComment(comments[random(comments.length)]);
			dummyRate.setRateValue(random(6));
			dummyRate.setMenuId(menuList.get(random(menuList.size())).getId());
			dummyRate.setBuilding("bonbu");
			
			rateGroovyMapper.insertRate(dummyRate);
		}
	}

	private void addDummyReservation(List<User> userList, List<Menu> menuList) {
		int limit = menuList.size();
		
		Reservation dummyReservation = new Reservation();
		for (User user : userList) {
			dummyReservation.setClientId(user.getId());
			dummyReservation.setMenuId(menuList.get(random(limit)).getId());
			dummyReservation.setReserveDate(new Date());
			dummyReservation.setType("LUNCH");
			
			reservationGroovyMapper.insertReservation(dummyReservation);
		}
	}

	private int random(int limit) {
		return (int) (Math.random() * limit);
	}

	private Menu createDummyMenu() {
		Menu menu = new Menu();
		menu.setBuilding("bonbu");
		menu.setProvide(new Date());
		return menu;
	}

	private void addDummyMenuData() {
		if (reservationGroovyMapper.countMenu() > 0) return;
		
		Menu dummyMenu = new Menu();
		for (int i = 0; i < menuTitles.length; i++) {
			dummyMenu.setBuilding("bonbu");
			dummyMenu.setProvide(new Date());
			dummyMenu.setTitle(menuTitles[i]);
			dummyMenu.setPrice(menuPrices[i]);
			
			reservationGroovyMapper.insertMenu(dummyMenu);
		}
	}

	@Override
	public void removeDummyData() {
		rateGroovyMapper.deleteAllRate();
		reservationGroovyMapper.deleteAllReservation();
		reservationGroovyMapper.deleteAllMenu();
	}

}
