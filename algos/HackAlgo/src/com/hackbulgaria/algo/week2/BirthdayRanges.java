package com.hackbulgaria.algo.week2;

import java.util.ArrayList;
import java.util.List;

public class BirthdayRanges {

	// Returns a vector with the number of people born in the specific ranges.
	public List<Integer> birthdaysCount(List<Integer> birthdays,
			List<Pair<Integer, Integer>> ranges) {

		int[] bdays = new int[366];
//		bornBefore[x] = number of people born before day x
		int[] bornBefore = new int[366];
		List<Integer> result = new ArrayList<Integer>();

		for (Integer bday : birthdays) {
			bdays[bday] += 1;
		}
		
		bornBefore[0] = 0;
		
		for (int i = 1; i < bdays.length; i++) {
			bornBefore[i] = bornBefore[i - 1] + bdays[i];
		}

		for (Pair<Integer, Integer> range : ranges) {
			int bdaysCount = bornBefore[range.second] - bornBefore[range.first - 1];
			result.add(bdaysCount);
		}

		return result;
	}
}
