package com.hackbulgaria.algo.week2;

public class Roots {
	private final double EPS = 0.00001;

	public double squareRoot(int number) {
		double low = 0;
		double high = (double) number;
		double candidate;
		double dnumber = (double) number;

		while (true) {
			candidate = (low + high) / 2;
			double candidateSquared = candidate * candidate;
			double diff = dnumber - candidateSquared;

			if (diff > 0 && diff < EPS || diff == 0) {
				System.out.println(dnumber - candidateSquared);
				break;
			} else if (candidateSquared > dnumber) {
				high = candidate;
			} else if (candidateSquared < dnumber) {
				low = candidate;
			}
		}

		return candidate;
	}
}
