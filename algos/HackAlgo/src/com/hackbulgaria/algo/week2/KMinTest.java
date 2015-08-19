package com.hackbulgaria.algo.week2;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class KMinTest {
	
	private KMin kMin;
	
	@Before
	public void setUp() throws Exception {
		kMin = new KMin();
	}

	@Test
	public void testKthMinimum() {
		List<Integer> numbers = new ArrayList<Integer>();
		
		numbers.add(5);
		numbers.add(2);
		numbers.add(3);
		numbers.add(6);
		numbers.add(1);
		numbers.add(4);
		
		assertEquals(1, kMin.kthMinimum(numbers, 1));
		assertEquals(2, kMin.kthMinimum(numbers, 2));
	}

}
