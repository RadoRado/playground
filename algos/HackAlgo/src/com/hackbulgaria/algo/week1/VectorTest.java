package com.hackbulgaria.algo.week1;

import static org.junit.Assert.assertEquals;

import org.junit.Before;
import org.junit.Test;

public class VectorTest {

	private Vector<Integer> vector;

	@Before
	public void setUp() throws Exception {
		this.vector = new Vector<Integer>();
	}

	@Test
	public void testVectorAdd() {
		assertEquals(0, vector.size());
		this.vector.add(1);
		assertEquals(1, vector.size());
	}
	
	@Test
	public void testVectorAddBeyondExpandSize() {
		int start = 0;
		int end = 3000;
		
		while(start <= end) {
			vector.add(start);
			start += 1;
		}
		
		assertEquals(3001, vector.size());
	}
	
	@Test
	public void testVectorGet() {
		vector.add(10);
		assertEquals(new Integer(10), vector.get(0));
	}
	
	@Test
	public void testVectorInsertAtBeginning() {
		vector.add(1);
		vector.add(2);
		
		vector.insert(0, 3);
		
		assertEquals(3, vector.size());
		assertEquals(new Integer(3), vector.get(0));
		assertEquals(new Integer(1), vector.get(1));
		assertEquals(new Integer(2), vector.get(2));
	}
	
	@Test
	public void testVectorInsertAtEnd() {
		vector.add(1);
		vector.add(2);
		
		vector.insert(1, 3);
		
		assertEquals(3, vector.size());
		assertEquals(new Integer(1), vector.get(0));
		assertEquals(new Integer(3), vector.get(1));
		assertEquals(new Integer(2), vector.get(2));
	}
	
	@Test
	public void testVectorInsertOnEmptyVector() {
		vector.insert(0, 1);
		
		assertEquals(1, vector.size());
		assertEquals(new Integer(1), vector.get(0));
	}
	
	@Test
	public void testVectorInsertBeyondInitialCapacity() {
		for(int i = 0; i < 2048; i++) {
			vector.add(i);
		}
		
		vector.insert(2047, 100);
		
		assertEquals(2049, vector.size());
		assertEquals(new Integer(100), vector.get(2047));
	}
 }
