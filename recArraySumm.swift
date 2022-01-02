//
//  recArraySumm.swift
//  Algorithms
//
//  Created by Денис Сизов on 02.01.2022.
//

import Foundation

func sum (_ array: Array<Int>) -> Int {
	var newArray = array
	if newArray.isEmpty {
		return 0
	}
	
	return newArray.removeFirst() + sum(newArray)
}
