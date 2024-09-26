import Cocoa
import Foundation
//for number in 1...100 {
//    if number % 3 == 0 && number % 5 == 0 {
//        print("FizzBuzz")
//    } else if number % 3 == 0 {
//        print("Fizz")
//    } else if number % 5 == 0 {
//        print("Buzz")
//    } else {
//        print(number)
//    }
//}


//func isPrime(_ number: Int) -> Bool {
//    if number < 2 {
//        return false
//    }
//    
//    for i in 2..<number {
//        if number % i == 0 {
//            return false
//        }
//    }
//    
//    return true
//}
//
//for number in 1...100 {
//    if isPrime(number) {
//        print(number)
//    }
//}
//
//func celsiusToFahrenheit(_ celsius: Double) -> Double {
//    return (celsius * 9/5) + 32
//}
//
//func celsiusToKelvin(_ celsius: Double) -> Double {
//    return celsius + 273.15
//}
//
//func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
//    return (fahrenheit - 32) * 5/9
//}
//
//func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
//    return (fahrenheit + 459.67) * 5/9
//}
//
//func kelvinToCelsius(_ kelvin: Double) -> Double {
//    return kelvin - 273.15
//}
//
//func kelvinToFahrenheit(_ kelvin: Double) -> Double {
//    return (kelvin * 9/5) - 459.67
//}
//
//func temperatureConverter() {
//    print("Enter the temperature value: ", terminator: "")
//    
//    if let input = readLine() {
//        if let temperature = Double(input.replacingOccurrences(of: ",", with: ".")) {
//            
//            print("Enter the unit of temperature (C for Celsius, F for Fahrenheit, K for Kelvin): ", terminator: "")
//            if let unit = readLine()?.uppercased() {
//                switch unit {
//                case "C":
//                    let fahrenheit = celsiusToFahrenheit(temperature)
//                    let kelvin = celsiusToKelvin(temperature)
//                    print("\(temperature)°C = \(fahrenheit)°F")
//                    print("\(temperature)°C = \(kelvin) K")
//                    
//                case "F":
//                    let celsius = fahrenheitToCelsius(temperature)
//                    let kelvin = fahrenheitToKelvin(temperature)
//                    print("\(temperature)°F = \(celsius)°C")
//                    print("\(temperature)°F = \(kelvin) K")
//                    
//                case "K":
//                    let celsius = kelvinToCelsius(temperature)
//                    let fahrenheit = kelvinToFahrenheit(temperature)
//                    print("\(temperature) K = \(celsius)°C")
//                    print("\(temperature) K = \(fahrenheit)°F")
//                    
//                default:
//                    print("Invalid unit. Please enter C, F, or K.")
//                }
//                
//            } else {
//                print("Invalid input for unit.")
//            }
//            
//        } else {
//            print("Invalid temperature value.")
//        }
//    } else {
//        print("Error reading input.")
//    }
//}
//
//temperatureConverter()


struct ShoppingListStructure {
    var item: String
    var price: Double
    var description: String
    var type: String
}

class ShoppingListItem {
    private var shopList: [ShoppingListStructure] = []
    
    func addItem(_ item: ShoppingListStructure) {
        shopList.append(item)
    }
    
    func getAll() -> [ShoppingListStructure] {
        return shopList
    }
    
    func removeItem(_ itemName: String) {
        shopList.removeAll { $0.item == itemName }
    }
    
    func printList() {
        if shopList.isEmpty {
            print("List is empty.")
        } else {
            for item in shopList {
                print("Item: \(item.item), Price: \(item.price), Description: \(item.description), Type: \(item.type)")
            }
        }
    }
}

let shoppingList = ShoppingListItem()

func showMenu() {
    print("""
    -----------------------------------
    Shopping List Menu:
    1. Add item
    2. Remove item
    3. View shopping list
    4. Exit
    -----------------------------------
    """)
}


var running = true
while running {
    showMenu()
    
    if let choice = readLine(), let option = Int(choice) {
        switch option {
        case 1:
            print("Enter item name:")
            let itemName = readLine() ?? ""
            
            print("Enter item price:")
            let itemPrice = Double(readLine() ?? "0") ?? 0
            
            print("Enter item description:")
            let itemDescription = readLine() ?? ""
            
            print("Enter item type:")
            let itemType = readLine() ?? ""
            
            let newItem = ShoppingListStructure(item: itemName, price: itemPrice, description: itemDescription, type: itemType)
            shoppingList.addItem(newItem)
            print("Item added")
            
        case 2:
            // Удаление элемента
            print("Enter the name of the item to remove:")
            let itemName = readLine() ?? ""
            shoppingList.removeItem(itemName)
            print("Item removed")
            
        case 3:
            // Печать списка покупок
            shoppingList.printList()
            
        case 4:
            // Выход из программы
            print("Exiting")
            running = false
            
        default:
            print("Please choose 1, 2, 3, 4")
        }
    } else {
        print("Invalid input")
    }
}




func removePunctuation(from text: String) -> String {
    let allowedCharacters = CharacterSet.alphanumerics.union(CharacterSet.whitespaces)
    return text.unicodeScalars.filter { allowedCharacters.contains($0) }.map(String.init).joined()
}

func wordFrequencyCounter(sentence: String) {
    let cleanedSentence = removePunctuation(from: sentence.lowercased())
    
    let words = cleanedSentence.split(separator: " ").map { String($0) }
    
    var wordFrequency: [String: Int] = [:]
    
    for word in words {
        wordFrequency[word, default: 0] += 1
    }
    
    for (word, count) in wordFrequency {
        print("\(word): \(count)")
    }
}

//print("Enter a sentence: ", terminator: "")
//if let input = readLine() {
//    wordFrequencyCounter(sentence: input)
//} else {
//    print("No input received.")
//}

wordFrequencyCounter(sentence: "Hello, world! Hello Swift. Hello Programming.")


func fibonacci(_ n: Int) -> [Int] {
    guard n > 0 else {
        return []
    }
    
    var sequence: [Int] = [0, 1]
    
    if n == 1 {
        return [0]
    } else if n == 2 {
        return sequence
    }
    
    for _ in 2..<n {
        let nextNumber = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(nextNumber)
    }
    
    return sequence
}

let n = 3
let fibSequence = fibonacci(n)
print("\(n) => \(fibSequence)")


func processGrades(students: [String: Double]) {
    guard !students.isEmpty else {
        print("No students' data available.")
        return
    }
    
    let scores = Array(students.values)
    
    let totalScore = scores.reduce(0, +)
    let averageScore = totalScore / Double(students.count)
    
    let highestScore = scores.max() ?? 0
    let lowestScore = scores.min() ?? 0
    
    print("Average score: \(averageScore)")
    print("Highest score: \(highestScore)")
    print("Lowest score: \(lowestScore)")
    
    for (student, score) in students {
        let status = score >= averageScore ? "above" : "below"
        print("\(student): \(score) (\(status) average)")
    }
}

let students = [
    "Alice": 85.0,
    "Bob": 92.0,
    "Charlie": 78.0,
    "David": 88.0,
    "Eve": 95.0
]

processGrades(students: students)



func isPalindrome(_ text: String) -> Bool {
    let cleanedText = text.lowercased().filter { $0.isLetter }
    
    return cleanedText == String(cleanedText.reversed())
}

let testText1 = "A man, a plan, a canal, Panama!"
let testText2 = "Hello, World!"

print("\(testText1) -> isPalindrome? \(isPalindrome(testText1))")
print("\(testText2) -> isPalindrome? \(isPalindrome(testText2))")


func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double? {
    if b == 0 {
        print("Error div / is prohibiited.")
        return nil
    }
    return a / b
}


func calculator() {
    var continueCalculating = true
    
    while continueCalculating {
        print("first number: ", terminator: "")
        guard let input1 = readLine(), let num1 = Double(input1) else {
            print("Invalid input")
            continue
        }
        
        print("second number: ", terminator: "")
        guard let input2 = readLine(), let num2 = Double(input2) else {
            print("Invalid input")
            continue
        }
        
        print("(+, -, *, /): ", terminator: "")
        guard let operation = readLine() else {
            print("Invalid input")
            continue
        }
        
        var result: Double?
        
        switch operation {
        case "+":
            result = add(num1, num2)
        case "-":
            result = subtract(num1, num2)
        case "*":
            result = multiply(num1, num2)
        case "/":
            result = divide(num1, num2)
        default:
            print("choose +, -, *, or /.")
            continue
        }
        
        if let result = result {
            print("Result: \(result)")
        }
        
        print("Type yes to resume calc? (y/n): ", terminator: "")
        if let response = readLine()?.lowercased(), response != "y" {
            continueCalculating = false
        }
    }
}

//calculator()

func hasUniqueCharacters(_ text: String) -> Bool {
    var characterSet: Set<Character> = []
    
    for char in text {
        if characterSet.contains(char) {
            return false
        }
        characterSet.insert(char)
    }
    
    return true
}

let text1 = "abcdefg"
let text2 = "hello"

print("\(text1) is unique: \(hasUniqueCharacters(text1))")
print("\(text2) is unique: \(hasUniqueCharacters(text2))")

