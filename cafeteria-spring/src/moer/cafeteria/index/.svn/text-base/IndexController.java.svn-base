package moer.cafeteria.index;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

@Controller
public class IndexController {
	@Autowired IndexService indexService;
	
	@RequestMapping("index")
	public String index() {
		return "index/main";
	}
	
	@RequestMapping("setdb")
	public String setDatabase() {
		indexService.addDummyData();
		return "redirect:/index";
	}
	
	@RequestMapping("cleardb")
	public String clearDatabase() {
		indexService.removeDummyData();
		return "redirect:/index";
	}
	
}
