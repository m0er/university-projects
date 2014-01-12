package com.moerog.test;

import junit.framework.TestCase;

public class EnumTest extends TestCase {
	private enum Category {
		ESL {
			public String toString() { return "1"; }
		};				
	}
	
	public void testEnum() throws Exception {		
		System.out.println(Category.valueOf("ESL"));
		Category[] cats = Category.values();
		for (int i=0; i<cats.length; i++) {
			System.out.println(cats[i].name());
			System.out.println(cats[i].ordinal());
		}

	}
}
