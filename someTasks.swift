//
//  someTasks.swift
//  Algorithms
//
//  Created by Денис Сизов on 19.01.2022.
//

import Foundation

/// Проверяет, является ли английская фраза панграммой (содержит все буквы алфавита для теста шрифтов, например)
func pangramEnglish(string: String) -> Bool {
	let set = Set(string.lowercased())
	let result = set.filter {
		// чтобы пробелы, запятые итд игнорить
		$0 >= "a" && $0 <= "z"
	}
	
	// В английском алфавите 26 букв
	return result.count == 26
}
//print(pangramEnglish(string: "The quick brown fox jumps over the lazy dog"))

/// Вращает строку на offset количество символов. Переносит из конца в начало.
// TODO: - Если нужно проверить, является ли строка вращением другой строки,
// то нужно удвоить строку (абс + абс) и через contain посмотреть.
// удвоенная строка всегда содержит все вращениям себя
func rotate(string: String, offset: Int) -> String? {
	guard string.count > offset else { return nil }
	let suffix = String(string.suffix(offset))
	let prefix = String(string.prefix(string.count - offset))
	
	return suffix + prefix
}
// Optional("wiftTayloy S")
//print(rotate(string: "Tayloy Swift", offset: 4))

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

/// Сравнивает, содержат ли две строки одни и те же символы. Можно решить намного проще через string1.sorted() == string2.sorted(), не знал
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
