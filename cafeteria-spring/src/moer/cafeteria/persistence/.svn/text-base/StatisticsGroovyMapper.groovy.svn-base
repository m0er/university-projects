package moer.cafeteria.persistence;

import java.util.List;

import moer.cafeteria.reservation.*;
import moer.cafeteria.statistics.Statistics;

import org.apache.ibatis.annotations.*;

public interface StatisticsGroovyMapper {

	@Select("""
		SELECT title, count(*) as count
		FROM reservation r, menu m
		WHERE r.reserve_date = #{reserveDate}
		AND r.menu_id = #{menuId}
		AND m.id = r.menu_id
	""")
	Statistics getDailySelling(@Param("reserveDate") String reserveDate, @Param("menuId") int menuId);

	@Select("SELECT count(*) FROM reservation WHERE menu_id = #{menuId}")
	int getReservationCountByMenu(int menuId);

	@Select("""
		SELECT DISTINCT m.id as menuId
		FROM reservation r, menu m
		WHERE r.reserve_date = #{today}
		AND m.building = #{building}
		AND m.provide_date = #{today}
	""")
	List<Reservation> getDistinctTodayReservation(@Param("today") String today, @Param("building") String building);
}
