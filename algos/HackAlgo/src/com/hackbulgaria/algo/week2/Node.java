package com.hackbulgaria.algo.week2;

import java.util.ArrayList;
import java.util.List;

public class Node {
	public int value;
	public Node next;
	
	
	public Node() {
		this.next = null;
	}
	
	public Node(int value) {
		this();
		this.value = value;
	}
	
	public List<Integer> expand() {
		List<Integer> result = new ArrayList<>();
		
		Node current = this;
		
		while(current != null) {
			result.add(current.value);
			current = current.next;
		}
		
		return result;
	}
	
	public static void main(String[] args) {
		Node a = new Node(1);
		Node b = new Node(2);
		Node c = new Node(3);
		
		a.next = b;
		b.next = c;
		
		System.out.println(a.expand());
	}
}
