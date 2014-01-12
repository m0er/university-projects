package moer.meetup.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface EventMapper {
	
	@Insert("INSERT INTO event(id, meeting_id) VALUES(#{id}, #{meetingId})")
	void insert(@Param("id") String id, @Param("meetingId") int meetingId);
	
	@Select("SELECT id FROM event WHERE meeting_id = #{meetingId}")
	String selectId(int meetingId);
	
	@Delete("DELETE FROM event WHERE meeting_id = #{meetingId}")
	int delete(int meetingId);
	
	@Select("SELECT meeting_id FROM event")
	List<Integer> selectAllMeetingId();
	
	@Delete("DELETE FROM event")
	int deleteAll();
	
}
