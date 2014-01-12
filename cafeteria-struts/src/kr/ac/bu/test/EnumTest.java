package kr.ac.bu.test;

import org.apache.log4j.Logger;

import junit.framework.TestCase;

public class EnumTest extends TestCase {
	private static Logger logger = Logger.getLogger(EnumTest.class);
	
	private enum Buildings {
		BONBU {
			public String toString() {
				return "���ε�";
			}
		},
		
		BOKJI {
			public String toString() {
				return "������";
			}
		},
		
		PROF {
			public String toString() {
				return "����ȸ��";
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
