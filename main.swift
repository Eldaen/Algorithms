//
//  main.swift
//  Algorithms
//
//  Created by Денис Сизов on 30.12.2021.
//

import Foundation

//print("Hello")

func countFractal(for value: Int) -> Int {
	if value == 1 {
		return 1
	}
	
	return value * countFractal(for: value - 1)
}

//print(countFractal(for: 7))


