package com.hackbulgaria.algo.week2;

import java.util.ArrayList;
import java.util.List;

public class KMin {

	public int quickSelect(List<Integer> numbers, int k, int times) {
		System.out.println(numbers);
		// can be better
		int pivotIndex = (0 + numbers.size()) / 2;

		List<Integer> lesser = new ArrayList<>();
		List<Integer> greater = new ArrayList<>();

		for (Integer number : numbers) {
			if (number < numbers.get(pivotIndex)) {
				lesser.add(number);
			} else if (number >= numbers.get(pivotIndex)) {
				greater.add(number);
			}
		}
		
		System.out.println(lesser);
		System.out.println(greater);
		
		pivotIndex = lesser.size();

		if (k == pivotIndex) {
			return numbers.get(pivotIndex);
		} else if (k < pivotIndex) {
			return quickSelect(lesser, k, times + 1);
		} else {
			return quickSelect(greater, k, times + 1);
		}
	}

	public int kthMinimum(List<Integer> numbers, int k) {
		return quickSelect(numbers, k, 1);
	}
}
