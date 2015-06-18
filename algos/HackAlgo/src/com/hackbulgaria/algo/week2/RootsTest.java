package com.hackbulgaria.algo.week2;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class RootsTest {
	private Roots roots;
	@Before
	public void setUp() throws Exception {
		roots = new Roots();
	}

	@Test
	public void testSquareRoot() {
		assertEquals(2.23606, roots.squareRoot(5), 0.00001);
	}
	
	@Test
	public void testSquareRootWithIntSquare() {
		assertEquals(2.0, roots.squareRoot(4), 0.00001);
	}

}
