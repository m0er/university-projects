package moer.cafeteria.util;

import java.text.*;
import java.util.*;

public class DateFormatUtil {
	private static DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	
	public static String dateToString(Date date) {
		return df.format(date);
	}
	
	public static Date stringToDate(String dateString) {
		Date date = null;
		try {
			date = df.parse(dateString);
		} catch (ParseException e) {
			throw new RuntimeException(e);
		}
		return date;
	}
}
