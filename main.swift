//
//  main.swift
//  Algorithms
//
//  Created by Денис Сизов on 30.12.2021.
//

import Foundation

func findSmallest(array: Array<Int>) -> Int? {
	if array.isEmpty {
		return nil
	}
	
	var smallestIndex = 0
	var smallest = array[smallestIndex]
	
	for (index, item) in array.enumerated() {
		if smallest < item {
			continue
		} else {
			smallest = item
			smallestIndex = index
		}
	}
	
	return smallestIndex
}

let testArr = [22, 50, 15, 25, 16, 17, 1, 8, 32]
print(findSmallest(array: testArr))

func selectionSort(array: Array<Int>) -> Array<Int> {
	var newArray = [Int]()
	var searchArray = array
	
	for _ in searchArray {
		if let smallestIndex = findSmallest(array: searchArray) {
			newArray.append(searchArray.remove(at: smallestIndex))
		}
	}
	
	return newArray
}

print(selectionSort(array: testArr))

