package moer.meetup.persistence;

import static org.hamcrest.Matchers.*;
import static org.junit.Assert.*;

import java.util.Date;

import moer.meetup.meeting.Meeting;
import moer.meetup.user.User;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"/applicationContext.xml"})
public class MeetingMapperTest {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MeetingMapper meetingMapper;
	@Autowired CalendarMapper calendarMapper;
	@Autowired UserMapper userMapper;
	
	@Before
	public void setUp() {
		calendarMapper.deleteAllEvents();
		meetingMapper.deleteAllAttendees();
		meetingMapper.deleteAll();
		userMapper.deleteAll();
		
		User user = new User();
		user.setEmail("foobar@gmail.com");
		user.setPassword("test");
		userMapper.insert(user);
	}
	
	@Test
	public void insert() {
		Meeting testMeeting = new Meeting();
		testMeeting.setTitle("테스트 미팅1");
		testMeeting.setOpenDate(new Date());
		testMeeting.setCloseDate(new Date());
		testMeeting.setLimitAttendee(10);
		testMeeting.setOwner("foobar@gmail.com");
		testMeeting.setDescription("테스트를 하는 미팅");
		testMeeting.setLocation("Seoul");
		
		meetingMapper.insert(testMeeting);
		assertThat(meetingMapper.count(), is(1));
		assertThat(testMeeting.getId(), is(not(0)));
		
		Meeting selectedMeeting = meetingMapper.selectAll().get(0);
		assertThat(selectedMeeting.getTitle(), is(equalTo(testMeeting.getTitle())));
	}

}
