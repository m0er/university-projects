package moer.meetup.calendar;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.TimeZone;

import moer.meetup.meeting.Meeting;
import moer.meetup.persistence.CalendarMapper;
import moer.meetup.persistence.EventMapper;
import moer.meetup.persistence.MeetingMapper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.api.client.auth.oauth2.draft10.AccessTokenResponse;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAccessProtectedResource;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAccessTokenRequest.GoogleAuthorizationCodeGrant;
import com.google.api.client.googleapis.auth.oauth2.draft10.GoogleAuthorizationRequestUrl;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson.JacksonFactory;
import com.google.api.client.util.DateTime;
import com.google.api.services.calendar.Calendar;
import com.google.api.services.calendar.model.CalendarList;
import com.google.api.services.calendar.model.CalendarListEntry;
import com.google.api.services.calendar.model.Event;
import com.google.api.services.calendar.model.EventAttendee;
import com.google.api.services.calendar.model.EventDateTime;

@Service("calendarService")
public class CalendarService {
	private static final String CLIENT_ID = "951113559321-c4p6ta3tcutkjsi886gqtlgm3p7nes9s.apps.googleusercontent.com";
	private static final String CLIENT_SECRET = "yUTo8UovoC_CAzFkmuy7RRf-";
	private static final String REDIRECT_URL = "http://localhost:8080/meetup/calendar/oauthcallback";
	private static final String SCOPE = "https://www.googleapis.com/auth/calendar";
	private static final String SUMMARY = "Meet-Up";

	private static HttpTransport httpTransport = new NetHttpTransport();
	private static JacksonFactory jsonFactory = new JacksonFactory();
	
	@Autowired CalendarMapper calendarMapper;
	@Autowired EventMapper eventMapper;
	@Autowired MeetingMapper meetingMapper;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	private Calendar service;

	public String getAuthorizationRequestUrl() {
		GoogleAuthorizationRequestUrl googleAuthorizationRequestUrl = 
				new GoogleAuthorizationRequestUrl(CLIENT_ID, REDIRECT_URL, SCOPE);
		googleAuthorizationRequestUrl.setApprovalPrompt("force");
		return googleAuthorizationRequestUrl.build();
	}

	public boolean getAccessToken(String code) {
		logger.info("authorization code: " + code);
		try {
			AccessTokenResponse response = new GoogleAuthorizationCodeGrant(httpTransport, jsonFactory,
					CLIENT_ID, CLIENT_SECRET, code, REDIRECT_URL).execute();

			GoogleAccessProtectedResource accessProtectedResource = new GoogleAccessProtectedResource(
					response.accessToken, httpTransport, jsonFactory, CLIENT_ID, CLIENT_SECRET,
					response.refreshToken);

			service = Calendar.builder(httpTransport, jsonFactory)
					.setApplicationName("Meet-Up")
					.setHttpRequestInitializer(accessProtectedResource)
					.build();
			logger.info("calenar: " + service);
			return true;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	private CalendarListEntry getCalendarBySummary(String summary) {
		try {
			CalendarList calendarList = service.calendarList().list().execute();

			while (true) {
				for (CalendarListEntry calendarListEntry : calendarList.getItems()) {
					if (calendarListEntry.getSummary().equals(summary))
						return calendarListEntry;
				}
				String pageToken = calendarList.getNextPageToken();
				if (pageToken != null && !pageToken.isEmpty()) {
					calendarList = service.calendarList().list().setPageToken(pageToken).execute();
				} else {
					break;
				}
			}
			return null;
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void registerCalendar() {
		calendarMapper.deleteAll();
		calendarMapper.insert(getExistMeetUpCalendar());
	}
	
	private com.google.api.services.calendar.model.Calendar getExistMeetUpCalendar() {
		CalendarListEntry calendarListEntry = getCalendarBySummary(SUMMARY);
		com.google.api.services.calendar.model.Calendar calendar = new com.google.api.services.calendar.model.Calendar();
		calendar.setId(calendarListEntry.getId());
		calendar.setSummary(calendarListEntry.getSummary());
		calendar.setTimeZone(calendarListEntry.getTimeZone());
		return calendar;
	}

	public void createEvent(Meeting meeting) {
		try {
			Event event = new Event();

			event.setSummary(meeting.getTitle());
			event.setLocation(meeting.getLocation());
			event.setDescription(meeting.getDescription());
			
			List<EventAttendee> attendees = new ArrayList<EventAttendee>();
			attendees.add(new EventAttendee().setEmail(meeting.getOwner()));
			event.setAttendees(attendees);

			DateTime start = new DateTime(meeting.getOpenDate(), TimeZone.getTimeZone("UTC"));
			event.setStart(new EventDateTime().setDateTime(start));
			DateTime end = new DateTime(meeting.getCloseDate(), TimeZone.getTimeZone("UTC"));
			event.setEnd(new EventDateTime().setDateTime(end));
			
			com.google.api.services.calendar.model.Calendar calendar = calendarMapper.select();
			Event createdEvent = service.events().insert(calendar.getId(), event).execute();
			logger.info("created event? " + createdEvent.toString());
			
			// insert event information to db
			eventMapper.insert(createdEvent.getId(), meeting.getId());
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public void addAttendee(int meetingId, String email) {
		try {
			com.google.api.services.calendar.model.Calendar calendar = calendarMapper.select();
			String eventId = eventMapper.selectId(meetingId);
			String calendarId = calendar.getId();
			
			Event event = service.events().get(calendarId, eventId).execute();
			logger.info("retrived event: " + event.toString());
			
			List<EventAttendee> attendees = new ArrayList<EventAttendee>();
			attendees.add(new EventAttendee().setEmail(email));
			event.setAttendees(attendees);
			
			service.events().update(calendarId, event.getId(), event).execute();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}
	
	public void deleteEvent(int meetingId) {
		try {
			com.google.api.services.calendar.model.Calendar calendar = calendarMapper.select();
			service.events().delete(calendar.getId(), eventMapper.selectId(meetingId)).execute();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// remove event information to db
			eventMapper.delete(meetingId);
		}
	}
	
	public void deleteEventAttendee(int meetingId, String email) {
		try {
			com.google.api.services.calendar.model.Calendar calendar = calendarMapper.select();
			String calendarId = calendar.getId();
			String eventId = eventMapper.selectId(meetingId);
			Event event = service.events().get(calendarId, eventId).execute();
			
			List<EventAttendee> attendeeList = event.getAttendees();
			// prevent to ConcurrentModificationException
			Iterator<EventAttendee> iter = attendeeList.iterator();
			while (iter.hasNext()) {
				EventAttendee attendee = iter.next();
				logger.info("attend: " + attendee.toString());
				
				if (attendee.getEmail().equals(email))
					iter.remove();
			}
			
			event.setAttendees(attendeeList);
			service.events().update(calendarId, eventId, event).execute();
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

}
