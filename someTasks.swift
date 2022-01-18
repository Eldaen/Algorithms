//
//  someTasks.swift
//  Algorithms
//
//  Created by Денис Сизов on 19.01.2022.
//

import Foundation

/// Убрать из строки множественные пробелы и оставить только один
func removeSpaces(string: String) -> String {
	guard !string.isEmpty else { return string }
	return string.split(separator: " ").reduce("") { $0 + " " + String($1) }
}
//print(removeSpaces(string: "asdas1   2edqsacfw  213241 26Y3UG   1H2J3 BH1G2B    323QDSADAS aa  s ss          d"))

/// Убирает дубликаты символов
func removeDuplicates(string: String) -> String {
	guard !string.isEmpty else { return string }
	
	return string.reduce("", { result, character in
		!result.contains(character) ? result + String(character) : result
	})
}
//print(removeDuplicates(string: "asdas12edqsacfw21324126Y3UG1H2J3BH1G2BEJQNKI21323QDSADAS"))

///Считает количество повторов переданного символа в строке
func checkSymbol(string: String, symbol: Character) -> Int {
	guard !string.isEmpty else { return 0 }
	return string.reduce(0, { count, character in
		character == symbol ? count + 1 : count
	})
}
///print(checkSymbol(string: "asdas12edqsacfw21324126Y3UG1H2J3BH1G2BEJQNKI21323QDSADAS", symbol: "3"))

/// Сравнивает, является ли она другой наоборот. Можно решить намного проще через string1.reversed() == string2, не знал
func compareStrings(string1: String, string2: String) -> Bool {
	let string1Symbols = string1.reduce(into: [:]) { chars, value in
		chars[value, default: 0] += 1
	}
	
	let string2Symbols = string2.reduce(into: [:]) { chars, value in
		chars[value, default: 0] += 1
	}
	
	if string1Symbols == string2Symbols {
		return true
	} else {
		return false
	}
}
//print(compareStrings(string1: "asdasD", string2: "Dsadsa"))

/// Проверяет, является ли строка палиндромом, убирает пробелы и игнорирует регистри
func palindromCheck(_ string: String) -> Bool {
	guard !string.isEmpty else { return true }
	
	let newString = string.lowercased()
		.split(separator: " ")
		.reduce("", { $0 + $1 })
	
	if String(newString.reversed()) == newString {
		return true
	} else {
		return false
	}
}
//print(palindromCheck("А роза упала на лапу Азора"))

/// Проверяет символы в строке на уникальность, если что-то повторилось, то false
func uniqueCheck(_ string: String) -> Bool {
	guard !string.isEmpty else { return true }
	return Set(string).count == string.count
}
//print(uniqueCheck("asdfghjk"))
