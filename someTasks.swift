//
//  someTasks.swift
//  Algorithms
//
//  Created by Денис Сизов on 19.01.2022.
//

import Foundation

/// Сортирует массив в буквами или цифрами по возростанию и возвращает первые N элементов
extension Collection where Iterator.Element: Comparable {
	func sortUpToN(_ upTo: Int) -> [Iterator.Element] {
		return Array(self.sorted().prefix(upTo: upTo))
	}
}
//print([1,5,10,6,8,4].sortUpToN(3))
//print(["a", "k", "l", "b", "f"].sortUpToN(3))

/// Счетает кол-во повторений указанной цифры в коллекции типа INT
extension Collection where Iterator.Element == Int {
	func repetition (digit: Character) -> Int {
		return self.map { String($0).reduce(0) { $1 == digit ? $0 + 1 : $0  } }.reduce(0, +)
	}
}
//print([5,15,25,55,525].repetition(digit: "5"))

/// Взятие квадратного корня и округления до целочисленного, sqrt использовать нельзя
/// Про pow в задании ничего не было, так что возвести в степени 1/2 мы можем.
func squareRoot (_ value: Int) -> Int {
	return Int(pow(Double(value), 0.5))
}
//print(squareRoot(121))

// Сложение всех чисел от 0 до 9 в строке
func numbersAddition (_ string: String) -> Int {
	guard !string.isEmpty else { return 0 }
	return string.compactMap{ Int(String($0)) }
		.reduce(0, +)
}
//print(numbersAddition("b1a2c3"))

/// Получает строку и проверяет, что там только цифры, не символы или буквы
/// Приводим к INT-у через СompactMap и он откинет nil-ы
func numbersOnly(_ string: String) -> Bool {
	guard !string.isEmpty else { return false }
	let numbers = string.compactMap{ Int(String($0)) }
	return string.count == numbers.count ? true : false
}
//print(numbersOnly("asdas1212"))

/// Бинарный поворот, превращает 0010000 в 0000100, всегда 8 цифр
/// Radix есть и у INT и у UInt
func binaryReverse (_ value: UInt) -> UInt {
	guard value > 0 else { return 0 }
	var binaryString = String(value, radix: 2)
	
	if binaryString.count < 8 {
		let missingZeroes = 8 - binaryString.count
		binaryString = String(repeating: "0", count: missingZeroes) + binaryString
		
	}
	
	let reversed = String(binaryString.reversed())
	return UInt(reversed, radix: 2) ?? 0
}
//print(binaryReverse(32))
// 4


//BINARY STRING
// RADIX это основание, т.е. в шестнадцатеричной системе это будет 16
//let binaryString = String(someNumber, radix: 2)

/// Поменять местами два числа без использования 3й переменной
//var a = 3
//var b = 5
//
//a = a + b
//b = a - b
//a = a - b
// или swap(&a, &b)
// или (a, b) = (b, a)

/// Возводит число в степень, это рекурсивное решение, но есть стандартная функция  pow(Double, Double)
func powValue (_ value: Int, _ pow: Int) -> Int {
	guard value > 0, pow > 0 else { return 0 }
	guard pow != 1 else { return value }
	return powValue (value, pow - 1) * value
}
//print(powValue(2, 4))

/// Генерирует случайное число в заданном диапазоне целых чисел
func random (min: Int, max: Int) -> Int {
	return Int.random(in: min...max)
}
//print(random(min: 1, max: 100))

/// Пишет Three если число делется на 3 без остатка и Five если на 5. Если делится и на 3 и на 5, то Three Five
func divisionPrinter () {
	for index in 1...100 {
		print(index)
		
		if index % 3 == 0 && index % 5 == 0{
			print("Three Five")
		} else if index % 3 == 0 {
			print("Three")
		} else if index % 5 == 0 {
			print("Five")
		}
	}
}
//divisionPrinter()

/// Возвращает строчку со словами в том же порядке, но перевёрнутыми
func reverseWords(_ string: String) -> String {
	guard !string.isEmpty else { return "" }
	
	return string.split(separator: " ")
		.map { String($0.reversed()) }
		.joined(separator: " ")
}
//print(reverseWords("Hello world from some person"))

/// Второй вариант вывода кол-ва вхождений, узнал что можно вот так писать (key, value) -> String чтобы возвращать что нужно
func countInclusions2(_ string: String) -> String {
	return string.reduce(into: [:]) { array, symbol in
		array[symbol, default: 0] += 1
	}.compactMap { (key, value) -> String in
		"\(key)\(value)"
	}.joined(separator: "")
}
//print(countInclusions("fffaa"))

/// Считает кол-во повторяющихся символов и выводит строку символ - вхождение, пример покажет f3a2
func countInclusions(_ string: String) -> String {
	return string.reduce(into: [:]) { array, symbol in
		array[symbol, default: 0] += 1
	}.reduce("") {
		$0 + String($1.key) + String($1.value)
	}
}
//print(countInclusions("fffaa"))

/// Поиск самого длинного префикса для всех слов в массиве
/// Можно сделать через hasPrefix, сразу проверять слова на префикс из нескольких букв, хранить лучший префикс
func findLongestPrefix (strings: [String]) -> String? {
	guard !strings.isEmpty else { return nil }
	var result: String = ""
	
outer: for (index, character) in strings[0].enumerated() {
		for word in strings {
			if character != Array(word)[index] {
				break outer
			}
		}
		result += String(character)
	}
	
	return result
}
//print(findLongestPrefix(strings: ["Swing", "Swizzler", "Swipe", "Sword"]))

/// Проверяет, чтобы строки были одинаковой длинны и не отличались больше чем на 3 буквы
/// Можно ещё создать Array(string1) и Array(string2) и по ним уже бегать, а не string2.index(string2.startIndex, offsetBy: index)
func similarityCheck(string1: String, string2: String) -> Bool {
	guard string1.count == string2.count else { return false }
	
	var differenceCount: Int = 0
	for (index, character) in string1.enumerated() {
		if differenceCount >= 3 {
			return false
		} else if character == string2[string2.index(string2.startIndex, offsetBy: index)] {
			continue
		}
		differenceCount += 1
	}
	return true
}
//print(similarityCheck(string1: "asdasd", string2: "asdafg"))
//print(similarityCheck(string1: "asdasd", string2: "asbfgh"))

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
