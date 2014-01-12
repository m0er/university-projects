package moer.meetup.meeting;

import java.util.Date;
import java.util.List;

import moer.meetup.calendar.CalendarService;
import moer.meetup.user.User;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login")
@RequestMapping("meeting")
public class MeetingController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MeetingService meetingService;
	@Autowired CalendarService calendarService;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute("login") User user, Model model) {
		logger.info(user.toString());
		List<Meeting> meetingList = meetingService.getMeetingList(user.getEmail());
		model.addAttribute("meetingList", meetingList);
		model.addAttribute("count", meetingList.size());
		return "meeting/main";
	}
	
	@RequestMapping("/add")
	public String add(Meeting meeting, @ModelAttribute("login") User currentUser) {
		logger.info(meeting.toString());
		logger.info(currentUser.toString());
		
		meeting.setCreateDate(new Date());
		meeting.setOwner(currentUser.getEmail());
		
		meetingService.register(meeting);
		calendarService.createEvent(meeting);
		return "redirect:/meeting/list";
	}
	
	@RequestMapping("/join/{meetingId}")
	@ResponseBody
	public String join(@PathVariable("meetingId") int meetingId, @ModelAttribute("login") User currentUser) {
		logger.info("" + meetingId);
		logger.info(currentUser.toString());
		
		String email = currentUser.getEmail();
		meetingService.join(meetingId, email);
		calendarService.addAttendee(meetingId, email);
		return "join ok";
	}
	
	@RequestMapping("/leave/{meetingId}")
	@ResponseBody
	public String leave(@PathVariable("meetingId") int meetingId, @ModelAttribute("login") User currentUser) {
		String email = currentUser.getEmail();
		meetingService.leave(meetingId, email);
		calendarService.deleteEventAttendee(meetingId, email);
		return "leave ok";
	}
	
	@RequestMapping("/delete/{meetingId}")
	@ResponseBody
	public String delete(@PathVariable("meetingId") int meetingId) {
		logger.info("" + meetingId);
		calendarService.deleteEvent(meetingId);
		meetingService.cancel(meetingId);
		return "delete ok";
	}
}
