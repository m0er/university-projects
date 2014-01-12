package moer.cafeteria.persistence;

import moer.cafeteria.reservation.*;
import org.apache.ibatis.annotations.*;
import java.lang.*;
import java.io.*;
import java.net.*;
import java.util.*;
import groovy.lang.*;
import groovy.util.*;

public interface StatisticsGroovyMapper
 {
@org.apache.ibatis.annotations.Select(value="\n		SELECT title, count(*) as count\n		FROM reservation r, menu m\n		WHERE r.reserve_date = #{reserveDate}\n		AND r.menu_id = #{menuId}\n		AND m.id = r.menu_id\n	")  moer.cafeteria.statistics.Statistics getDailySelling(java.lang.String reserveDate, int menuId);
@org.apache.ibatis.annotations.Select(value="SELECT count(*) FROM reservation WHERE menu_id = #{menuId}")  int getReservationCountByMenu(int menuId);
@org.apache.ibatis.annotations.Select(value="\n		SELECT DISTINCT m.id as menuId\n		FROM reservation r, menu m\n		WHERE r.reserve_date = #{today}\n		AND m.building = #{building}\n		AND m.provide_date = #{today}\n	")  java.util.List<moer.cafeteria.reservation.Reservation> getDistinctTodayReservation(java.lang.String today, java.lang.String building);
}
