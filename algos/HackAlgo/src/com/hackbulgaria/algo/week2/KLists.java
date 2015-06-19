package com.hackbulgaria.algo.week2;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class KLists {
	
	public Node merge(List<Node> lists) {
		
		List<Integer> values = new ArrayList<>();
		
		for(Node list: lists) {
			for(Integer value: list.expand()) {
				values.add(value);
			}
		}
		
		Collections.sort(values);
		
		Node result = new Node(values.get(0));
		Node first = result;
		
		for(int i = 1; i < values.size(); i ++) {
			Node next = new Node(values.get(i));
			result.next = next;
			result = next;
		}
		
		return first;
	}
}
