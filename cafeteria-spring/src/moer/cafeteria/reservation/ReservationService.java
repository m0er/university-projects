package moer.cafeteria.reservation;

import java.util.*;

import moer.cafeteria.rate.*;

public interface ReservationService {
	
	void addMenu(Menu menu);

	List<Menu> getMenuList(Menu menu);
	
	void registerReservation(Reservation reservation);
	
	List<Reservation> getReservationListByBuilding(Reservation reservation);
	
	void confirmReservation(int id);
	
	void cancelReservation(int id);
	
	void addRate(Rate rate);
	
	RateDto getRate(int menuId);
	
}
