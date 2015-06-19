package com.hackbulgaria.algo.week2;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

public class KListTest {

	private KLists kLists;
	
	@Before
	public void setUp() throws Exception {
		kLists = new KLists();
	}

	@Test
	public void testMerge() {
		Node a = new Node(3);
		a.next = new Node(5);
		a.next.next = new Node(7);
		a.next.next.next = new Node(9);
		
		Node b = new Node(2);
		b.next = new Node(4);
		b.next.next = new Node(6);
		
		Node c = new Node(0);
		c.next = new Node(1);
		c.next.next = new Node(8);
		c.next.next.next = new Node(10);
		
		List<Node> lists = new ArrayList<>();
		lists.add(a);
		lists.add(b);
		lists.add(c);
		
		Integer[] expectedArray = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
		List<Integer> expected = new ArrayList<>(Arrays.asList(expectedArray));
		
		assertEquals(expected, kLists.merge(lists).expand());
	}

}
