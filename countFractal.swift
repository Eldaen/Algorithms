//
//  countFractal.swift.swift
//  Algorithms
//
//  Created by Денис Сизов on 02.01.2022.
//

import Foundation

func countFractal(for value: Int) -> Int {
	if value == 1 {
		return 1
	}
	
	return value * countFractal(for: value - 1)
}
