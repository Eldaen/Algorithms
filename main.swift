//
//  main.swift
//  Algorithms
//
//  Created by Денис Сизов on 30.12.2021.
//

import Foundation

func arrCount (_ arr: Array<Int>) -> Int {
	var arr = arr
	if arr.isEmpty {
		return 0
	}
	
	arr.removeFirst()
	return 1 + arrCount(arr)
}

func findMax(_ arr: Array<Int>, currentMax: Int = 0) -> Int {
	var arr = arr
	if arr.isEmpty {
		return currentMax
	}
	
	let currentElement = arr.removeFirst()
	
	if currentMax > currentElement {
		return findMax(arr, currentMax: currentMax)
	} else {
		return findMax(arr, currentMax: currentElement)
	}
}

func binarySearchRec(_ arr: Array<Int>, minIndex: Int, maxIndex: Int, element: Int) -> Bool {
	
	let index = ( maxIndex + minIndex ) / 2
	let currentElement = arr[index]
	
	if currentElement == element {
		return true
	} else if minIndex == maxIndex {
		return false
	}
	
	if element < currentElement {
		return binarySearchRec(arr, minIndex: minIndex, maxIndex: index - 1, element: element)
	} else {
		return binarySearchRec(arr, minIndex: index + 1, maxIndex: maxIndex, element: element)
	}
}

func checkArray(_ array: Array<Int>, for element: Int) -> Bool {
	return binarySearchRec(array, minIndex: 0, maxIndex: array.count - 1, element: element)
}

print(checkArray([2, 5, 7, 11, 13, 17], for: 22))
