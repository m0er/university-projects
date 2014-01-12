package moer.meetup.index;

import java.util.Enumeration;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
	
	@RequestMapping("index")
	public String index(HttpSession session) {
		if (isTokenIn(session))
			return "index/main";
		return "redirect:/calendar/oauth";
	}
	
	private boolean isTokenIn(HttpSession session) {
		Enumeration<String> attributeNames = session.getAttributeNames();
		while (attributeNames.hasMoreElements()) {
			String token = "";
			if ((token = attributeNames.nextElement()).equals("token"))
				if (session.getAttribute(token).equals("true"))
					return true;
		}
		return false;
	}
	
}
