package moer.meetup.persistence;

import java.util.List;

import moer.meetup.meeting.Attendee;
import moer.meetup.meeting.Meeting;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface MeetingMapper {
	
	@Insert("INSERT INTO meeting(title, limit_attendee, open_timestamp, close_timestamp, owner, description, location) VALUES(#{title}, #{limitAttendee}, #{openDate}, #{closeDate}, #{owner}, #{description}, #{location})")
	@Options(useGeneratedKeys=true, keyProperty="id")
	int insert(Meeting meeting);
	
	@Select("SELECT count(*) FROM meeting")
	int count();
	
	@Delete("DELETE FROM meeting")
	int deleteAll();
	
	@Select("SELECT id, title, limit_attendee as limitAttendee, create_timestamp as createDate, open_timestamp as openDate, close_timestamp as closeDate, location, owner, description FROM meeting")
	List<Meeting> selectAll();
	
	@Select("SELECT * FROM meeting WHERE id = #{id}")
	Meeting selectById(int id);
	
	@Insert("INSERT INTO attendee(meeting_id, user_id) VALUES(#{meetingId}, #{userEmail})")
	void insertAttendee(@Param("meetingId") int meetingId, @Param("userEmail") String userEmail);
	
	@Select("SELECT count(*) FROM attendee WHERE meeting_id = #{meetingId}")
	int attendeeCount(int meetingId);
	
	@Select("SELECT id, meeting_id as meetingId, user_id as userId FROM attendee WHERE meeting_id = #{meetingId}")
	List<Attendee> selectAttendee(int meetingId);
	
	@Delete("DELETE FROM meeting WHERE id = #{id}")
	int deleteById(int id);
	
	@Delete("DELETE FROM attendee WHERE meeting_id = #{meetingId}")
	int deleteAttendeeByMeetingId(int meetingId);
	
	@Delete("DELETE FROM attendee WHERE meeting_id = #{meetingId} AND user_id = #{userId}")
	int deleteAttendee(@Param("meetingId") int meetingId, @Param("userId") String userId);
	
	@Delete("DELETE FROM attendee")
	int deleteAllAttendees();
}
