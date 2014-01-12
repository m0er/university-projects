package kr.ac.bu.test;

import org.apache.log4j.Logger;

import junit.framework.TestCase;

public class EnumTest extends TestCase {
	private static Logger logger = Logger.getLogger(EnumTest.class);
	
	private enum Buildings {
		BONBU {
			public String toString() {
				return "본부동";
			}
		},
		
		BOKJI {
			public String toString() {
				return "복지동";
			}
		},
		
		PROF {
			public String toString() {
				return "교수회관";
			}
		};
	}
	
	public void testBuildings() throws Exception {
		logger.info(Buildings.BONBU);
		logger.info(Buildings.valueOf("BOKJI"));

		for (Buildings building : Buildings.values()) {
			logger.info(building.ordinal() + " : " + building.name());
		}
	}
}
