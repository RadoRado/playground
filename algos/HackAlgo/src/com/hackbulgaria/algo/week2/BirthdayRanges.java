package com.hackbulgaria.algo.week2;

import java.util.ArrayList;
import java.util.List;

public class BirthdayRanges {

	// Returns a vector with the number of people born in the specific ranges.
	public List<Integer> birthdaysCount(List<Integer> birthdays,
			List<Pair> ranges) {

		boolean[] bdays = new boolean[366];
		List<Integer> result = new ArrayList<Integer>();

		for (Integer bday : birthdays) {
			bdays[bday] = true;
		}

		for (Pair range : ranges) {
			int bdaysCount = 0;
			for (int i = range.start; i <= range.end; i++) {
				if (bdays[i]) {
					System.out.println(i);
					bdaysCount++;
				}
			}

			result.add(bdaysCount);
		}

		return result;
	}
}
