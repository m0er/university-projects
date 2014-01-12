package moer.cafeteria.persistence;

import moer.cafeteria.reservation.*;
import org.apache.ibatis.annotations.*;
import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

public interface ReservationGroovyMapper
 {
@org.apache.ibatis.annotations.Insert(value="INSERT INTO menu(price, title, building, provide_date) VALUES(#{price}, #{title}, #{building}, #{provide})")  void insertMenu(moer.cafeteria.reservation.Menu menu);
@org.apache.ibatis.annotations.Select(value="\n		SELECT id, price, title, building, provide_date as provide FROM menu \n		WHERE title = #{title} \n		AND building = #{building} \n		AND provide_date = #{provide}\n	")  moer.cafeteria.reservation.Menu getMenu(moer.cafeteria.reservation.Menu menu);
@org.apache.ibatis.annotations.Select(value="\n		SELECT id, price, title, building, provide_date as provide FROM menu \n		WHERE building = #{building} \n		AND provide_date = #{provide}\n	")  java.util.List<moer.cafeteria.reservation.Menu> getMenuList(moer.cafeteria.reservation.Menu menu);
@org.apache.ibatis.annotations.Delete(value="DELETE FROM menu")  void deleteAllMenu();
@org.apache.ibatis.annotations.Select(value="SELECT count(*) FROM menu")  int countMenu();
@org.apache.ibatis.annotations.Insert(value="INSERT INTO reservation(client_id, menu_id, reserve_date, type) VALUES(#{clientId}, #{menuId}, #{reserveDate}, #{type})")  void insertReservation(moer.cafeteria.reservation.Reservation reservation);
@org.apache.ibatis.annotations.Delete(value="\n		DELETE FROM reservation \n		WHERE id = #{id}")  void deleteReservation(int id);
@org.apache.ibatis.annotations.Delete(value="DELETE FROM reservation")  void deleteAllReservation();
@org.apache.ibatis.annotations.Select(value="\n		SELECT reservation.id id, client.id clientId, client.name, client.department, menu.title, menu.id menuId, menu.building, reservation.reserve_date reserveDate, reservation.type, reservation.confirmed, reservation.rated\n		FROM reservation, client, menu \n		WHERE menu.building = #{building} \n		AND client.id = reservation.client_id \n		AND menu.id = reservation.menu_id\n		AND reservation.reserve_date = #{reserveDate}\n	")  java.util.List<moer.cafeteria.reservation.Reservation> getReservationList(moer.cafeteria.reservation.Reservation reservation);
@org.apache.ibatis.annotations.Select(value="\n		SELECT count(*) FROM reservation, menu \n		WHERE menu.building = #{building} \n		AND menu.id = reservation.menu_id\n	")  int countReservationByBuilding(java.lang.String building);
@org.apache.ibatis.annotations.Update(value="UPDATE reservation SET confirmed = 1 WHERE id = #{id}")  void confirmReservation(int id);
@org.apache.ibatis.annotations.Update(value="UPDATE reservation SET rated = 1 WHERE id = #{id}")  void ratedReservation(int id);
}
