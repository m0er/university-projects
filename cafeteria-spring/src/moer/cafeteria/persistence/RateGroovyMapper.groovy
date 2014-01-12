package moer.cafeteria.persistence

import moer.cafeteria.rate.Rate

import org.apache.ibatis.annotations.*

public interface RateGroovyMapper {
	
	@Insert("INSERT INTO rate(client_id, menu_id, comment, rate_value, building) VALUES(#{userId}, #{menuId}, #{comment}, #{rateValue}, #{building})")
	void insertRate(final Rate rate);
	
	@Select("""
		SELECT comment, rate_value as rateValue, building, client_id as userId
		FROM rate
		WHERE rate.menu_id = #{menuId};
	""")
	List<Rate> getRateList(int menuId);
	
	@Delete("DELETE FROM rate")
	void deleteAllRate();
}
