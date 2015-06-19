package com.hackbulgaria.algo.week2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class BirthdayRangesTest {

	private BirthdayRanges b;

	@Before
	public void setUp() throws Exception {
		b = new BirthdayRanges();
	}

	@Test
	public void testBirthdayRanges() {
		Integer[] bdaysArray = { 5, 10, 6, 7, 3, 4, 5, 11, 21, 300, 15 };
		ArrayList<Integer> bdays = new ArrayList<Integer>(
				Arrays.asList(bdaysArray));
		List<Pair<Integer, Integer>> ranges = new ArrayList<>();

		ranges.add(new Pair(4, 9));
		ranges.add(new Pair(6, 7));
		ranges.add(new Pair(200, 225));
		ranges.add(new Pair(300, 365));

		List<Integer> expected = new ArrayList<Integer>();
		expected.add(5);
		expected.add(2);
		expected.add(0);
		expected.add(1);

		assertEquals(expected, b.birthdaysCount(bdays, ranges));
	}

}
