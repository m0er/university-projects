package moer.meetup.meeting;

import java.util.List;

import moer.meetup.persistence.MeetingMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("meetingService")
public class MeetingService {
	@Autowired MeetingMapper meetingMapper;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	public List<Meeting> getMeetingList(String email) {
		List<Meeting> meetingList = meetingMapper.selectAll();
		
		for (Meeting meeting : meetingList) {
			final int meetingId = meeting.getId();
			meeting.setAttendeeCount(meetingMapper.attendeeCount(meetingId));
			
			for (Attendee attendee : meetingMapper.selectAttendee(meetingId)) {
				if (attendee.getUserId().equals(email)) {
					meeting.setJoin(true);
				}
			}
		}
		
		return meetingList;
	}
	
	public void register(Meeting meeting) {
		meetingMapper.insert(meeting);
		join(meeting.getId(), meeting.getOwner());
	}

	public void join(int meetingId, String userEmail) {
		meetingMapper.insertAttendee(meetingId, userEmail);
	}
	
	public void leave(int meetingId, String userEmail) {
		meetingMapper.deleteAttendee(meetingId, userEmail);
	}

	public void cancel(int meetingId) {
		meetingMapper.deleteAttendeeByMeetingId(meetingId);
		meetingMapper.deleteById(meetingId);
	}
	
	public List<Attendee> getAttendeeList(int meetingId) {
		return meetingMapper.selectAttendee(meetingId);
	}

}
