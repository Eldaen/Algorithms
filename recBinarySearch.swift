//
//  recBinarySearch.swift
//  Algorithms
//
//  Created by Денис Сизов on 03.01.2022.
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

func binarySearchRec(_ arr: Array<Int>, element: Int) -> Bool {
	guard arr.isEmpty != true else { return false }
	
	let index = ( arr.count - 1 ) / 2
	let currentElement = arr[index]
	
	if currentElement == element {
		return true
	} else if arr.count == 1 {
		return false
	}
	
	if element < currentElement {
		return binarySearchRec(Array(arr[0..<index]), element: element)
	} else {
		return binarySearchRec(Array(arr[(index + 1)..<(arr.count)]), element: element)
	}
}

func checkArray(_ array: Array<Int>, for element: Int) -> Bool {
	return binarySearchRec(array, element: element)
}
