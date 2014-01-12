package moer.meetup.persistence;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import com.google.api.services.calendar.model.Calendar;

public interface CalendarMapper {
	
	@Insert("INSERT INTO calendar(id, summary, timezone) VALUES(#{id}, #{summary}, #{timeZone})")
	void insert(Calendar calendar);
	
	@Delete("DELETE FROM calendar")
	void deleteAll();
	
	@Select("SELECT id, summary, timezone as timeZone FROM calendar")
	Calendar select();
	
	@Delete("DELETE FROM event")
	int deleteAllEvents();
}
