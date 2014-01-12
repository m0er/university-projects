package moer.cafeteria.rate;

import java.util.*;

public class RateDto {
	private List<Rate> rateList;
	private int averageRate;
	private int size;
	
	public List<Rate> getRateList() {
		return rateList;
	}
	
	public void setRateList(List<Rate> rateList) {
		this.rateList = rateList;
		this.size = rateList.size();
		if (rateList != null && rateList.size() > 0)
			calculateAverageRate();
	}
	
	public int getSize() {
		return size;
	}

	private void calculateAverageRate() {
		double average = 0.0;
		for (Rate rate : rateList)
			average += rate.getRateValue();
		this.averageRate = (int) average / rateList.size();
	}

	public int getAverageRate() {
		return averageRate;
	}
}
