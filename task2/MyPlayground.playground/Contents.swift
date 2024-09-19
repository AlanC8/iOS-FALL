import Cocoa

var fruits = ["🍏","🥭","🍊","🍉","🍋‍🟩"]
print(fruits[2])

var numbers: Set = [7,5,3,1,13,17,19]
var newNumbers = numbers
numbers.insert(5)

for number in numbers{
    print(number)
}
print(newNumbers.elementsEqual(numbers))

var dictionary: [String: Int] = [
    "Swift": 2014,
    "Python": 1991,
    "Java": 1995
]

var bigDictionary: [String: [Int: String]] = [
    "Swift": [
        2014: "New apple programming language"
    ],
    "Python": [
        1991: "Best programming language for ML/AI"
    ],
    "Java": [
        1995: "Programming language that really cool"
    ]
]

for (language, year) in dictionary{
    print("\(language) was released in \(year).")
}

for (language, details) in bigDictionary {
    print("Language: \(language)")
    for (year, description) in details {
        print(" - Released in \(year): \(description)")
    }
}

var colors = ["Red", "Green", "Blue", "Yellow"]

colors[1] = "Purple"

print(colors)

let set1: Set = [1, 2, 3, 4]
let set2: Set = [3, 4, 5, 6]

let intersection = set1.intersection(set2)

print(intersection)


var studentScores = [
    "Alice": 85,
    "Bob": 90,
    "Charlie": 78
]

studentScores["Bob"] = 95

print(studentScores)

let array1 = ["apple", "banana"]
let array2 = ["cherry", "date"]

let mergedArray = array1 + array2

print(mergedArray)

var countryPopulations = [
    "USA": 331_000_000,
    "India": 1_380_000_000,
    "Brazil": 213_000_000
]

countryPopulations["Canada"] = 38_000_000

print(countryPopulations)

let set12: Set = ["cat", "dog"]
let set22: Set = ["dog", "mouse"]

let unionSet = set12.union(set22)

let finalSet = unionSet.subtracting(set22)

print(finalSet)

var studentGrades = [
    "Alice": [85, 90, 78],
    "Bob": [88, 92, 79],
    "Charlie": [91, 87, 85]
]

print(studentGrades["Alice"]?.first)
