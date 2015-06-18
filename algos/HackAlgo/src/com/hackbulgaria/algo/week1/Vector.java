package com.hackbulgaria.algo.week1;

public class Vector<T> {

	private T[] data;
	private int currentSize = 0;
	private int capacity = 2048;

	public Vector() {
		data = (T[]) new Object[capacity];
	}

	public void add(T value) {
		checkAndExpand();

		data[currentSize] = value;
		currentSize += 1;
	}

	public void insert(int index, T value) {
		checkAndExpand();

		T[] newData = (T[]) new Object[capacity];

		for (int i = 0; i < index; i++) {
			newData[i] = data[i];
		}

		newData[index] = value;

		for (int i = index; i < currentSize; i++) {
			newData[i + 1] = data[i];
		}

		currentSize += 1;
		data = newData;
	}

	public T get(int index) {
		return data[index];
	}

	public int size() {
		return currentSize;
	}

	private void checkAndExpand() {
		if (currentSize + 1 > capacity) {
			capacity = capacity * 2 + 1;
			T[] newData = (T[]) new Object[capacity];

			for (int i = 0; i < currentSize; i++) {
				newData[i] = data[i];
			}

			data = newData;
		}
	}
}
