package moer.cafeteria.reservation;

import java.util.*;

import moer.cafeteria.persistence.*;
import moer.cafeteria.rate.*;

import org.slf4j.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Service("reservationService")
public class ReservationServiceImpl implements ReservationService {
	@Autowired ReservationGroovyMapper reservationGroovyMapper;
	@Autowired RateGroovyMapper rateGroovyMapper;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Override
	public void addMenu(Menu menu) {
		reservationGroovyMapper.insertMenu(menu);
	}

	@Override
	public List<Menu> getMenuList(Menu menu) {
		return reservationGroovyMapper.getMenuList(menu);
	}

	@Override
	public void registerReservation(Reservation reservation) {
		reservationGroovyMapper.insertReservation(reservation);
	}

	@Override
	public List<Reservation> getReservationListByBuilding(Reservation reservation) {
		reservation.setReserveDate(new Date());
		return reservationGroovyMapper.getReservationList(reservation);
	}

	@Override
	public void confirmReservation(int id) {
		reservationGroovyMapper.confirmReservation(id);
	}

	@Override
	public void cancelReservation(int id) {
		reservationGroovyMapper.deleteReservation(id);
	}

	@Override
	public void addRate(Rate rate) {
		reservationGroovyMapper.ratedReservation(rate.getReservationId());
		rateGroovyMapper.insertRate(rate);
	}

	@Override
	public RateDto getRate(int menuId) {
		RateDto rateDto = new RateDto();
		final List<Rate> rateList = rateGroovyMapper.getRateList(menuId);
		logger.info(rateList.toString());
		rateDto.setRateList(rateList);
		return rateDto;
	}
}
