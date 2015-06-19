package com.hackbulgaria.algo.week2;

import java.util.ArrayList;
import java.util.List;

public class BirthdayRanges {

	// Returns a vector with the number of people born in the specific ranges.
	public List<Integer> birthdaysCount(List<Integer> birthdays,
			List<Pair> ranges) {

		int[] bdays = new int[366];
		List<Integer> result = new ArrayList<Integer>();

		for (Integer bday : birthdays) {
			bdays[bday] += 1;
		}

		for (Pair range : ranges) {
			int bdaysCount = 0;
			for (int i = range.start; i <= range.end; i++) {
				bdaysCount += bdays[i];
			}

			result.add(bdaysCount);
		}

		return result;
	}
}
