package moer.cafeteria.statistics;

import java.util.ArrayList;
import java.util.List;

import moer.cafeteria.persistence.StatisticsGroovyMapper;
import moer.cafeteria.reservation.Reservation;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("statisticsService")
public class StatisticsServiceImpl implements StatisticsService {
	@Autowired StatisticsGroovyMapper statisticsGroovyMapper;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public List<Statistics> getStatisticsByDay(String today, String building) {
		List<Statistics> statisticsList = new ArrayList<Statistics>();
		
		List<Reservation> reservationList = statisticsGroovyMapper.getDistinctTodayReservation(today, building);
		for (Reservation reservation : reservationList) {
			int menuId = reservation.getMenuId();
			Statistics statistics = statisticsGroovyMapper.getDailySelling(today, menuId);
			logger.info("daily selling: " + statistics.toString());
			
			statisticsList.add(statistics);
		}
		
		return statisticsList;
	}

	@Override
	public List<Statistics> getStatisticsByRange(String to, String from, String building) {
		throw new UnsupportedOperationException();
	}

}
