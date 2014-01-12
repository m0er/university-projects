package moer.cafeteria.persistence

import moer.cafeteria.reservation.*

import org.apache.ibatis.annotations.*

public interface ReservationGroovyMapper {
	
	@Insert("INSERT INTO menu(price, title, building, provide_date) VALUES(#{price}, #{title}, #{building}, #{provide})")
	void insertMenu(final Menu menu);
	
	@Select("""
		SELECT id, price, title, building, provide_date as provide FROM menu 
		WHERE title = #{title} 
		AND building = #{building} 
		AND provide_date = #{provide}
	""")
	Menu getMenu(final Menu menu);
	
	@Select("""
		SELECT id, price, title, building, provide_date as provide FROM menu 
		WHERE building = #{building} 
		AND provide_date = #{provide}
	""")
	List<Menu> getMenuList(final Menu menu);
	
	@Delete("DELETE FROM menu")
	void deleteAllMenu();
	
	@Select("SELECT count(*) FROM menu")
	int countMenu();
	
	@Insert("INSERT INTO reservation(client_id, menu_id, reserve_date, type) VALUES(#{clientId}, #{menuId}, #{reserveDate}, #{type})")
	void insertReservation(final Reservation reservation);
	
	@Delete("""
		DELETE FROM reservation 
		WHERE id = #{id}""")
	void deleteReservation(int id);
	
	@Delete("DELETE FROM reservation")
	void deleteAllReservation();
	
	@Select("""
		SELECT reservation.id id, client.id clientId, client.name, client.department, menu.title, menu.id menuId, menu.building, reservation.reserve_date reserveDate, reservation.type, reservation.confirmed, reservation.rated
		FROM reservation, client, menu 
		WHERE menu.building = #{building} 
		AND client.id = reservation.client_id 
		AND menu.id = reservation.menu_id
		AND reservation.reserve_date = #{reserveDate}
	""")
	List<Reservation> getReservationList(Reservation reservation);
	
	@Select("""
		SELECT count(*) FROM reservation, menu 
		WHERE menu.building = #{building} 
		AND menu.id = reservation.menu_id
	""")
	int countReservationByBuilding(String building);
	
	@Update("UPDATE reservation SET confirmed = 1 WHERE id = #{id}")
	void confirmReservation(int id);
	
	@Update("UPDATE reservation SET rated = 1 WHERE id = #{id}")
	void ratedReservation(int id);
}
