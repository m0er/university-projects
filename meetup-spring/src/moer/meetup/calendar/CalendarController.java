package moer.meetup.calendar;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("calendar")
@SessionAttributes("token")
public class CalendarController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CalendarService calendarService;
	
	@RequestMapping("/oauth")
	public String getOAuth() {
		String authorizationUrl = calendarService.getAuthorizationRequestUrl();
		logger.info(authorizationUrl);
		return "redirect:" + authorizationUrl;
	}
	
	@RequestMapping("/oauthcallback")
	public String afterAuthorize(@RequestParam("code") String code, Model model) {
		if (calendarService.getAccessToken(code))
			model.addAttribute("token", "true");
		return "redirect:/index";
	}
	
	@RequestMapping("/register")
	public String calendarList() {
		calendarService.registerCalendar();
		return "redirect:/index";
	}
	
}
