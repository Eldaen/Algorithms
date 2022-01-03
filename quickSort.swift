//
//  quickSort.swift
//  Algorithms
//
//  Created by Денис Сизов on 03.01.2022.
//

import Foundation

func quickSort(_ arr: Array<Int>) -> Array<Int> {
	if arr.count < 2 {
		return arr
	} else {
		// Опорный элемент, выберем пока первый в массиве
		let pivot = arr[0]
		
		let lesserArr = arr.filter { $0 < pivot }
		let greaterArr = arr.filter { $0 > pivot }
		
		return quickSort(lesserArr) + [pivot] + quickSort(greaterArr)
	}
}
