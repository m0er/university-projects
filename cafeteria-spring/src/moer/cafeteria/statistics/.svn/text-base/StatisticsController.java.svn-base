package moer.cafeteria.statistics;

import java.util.Date;
import java.util.List;

import moer.cafeteria.util.DateFormatUtil;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("statistics")
public class StatisticsController {
	private Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired StatisticsService statisticsService;
	
	@RequestMapping("/{building}")
	public String index(@PathVariable String building, Model model) {
		logger.info("which building statistics?: " + building);
		return "statistics/main";
	}
	
	@RequestMapping(value="/today/{building}", method=RequestMethod.GET)
	@ResponseBody
	public List<Statistics> getTodayStatistics(@PathVariable String building) {
		logger.info("get statistics today of " + building);
		return statisticsService.getStatisticsByDay(DateFormatUtil.dateToString(new Date()), building);
	}
	
}
