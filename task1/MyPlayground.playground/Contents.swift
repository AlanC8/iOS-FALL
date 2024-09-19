import Cocoa
//
//struct Task {
//    var name: String
//    var isCompleted: Bool = false;
//}
//
//enum TaskStatus{
//    case Completed
//    case pending
//}
//
//class TodoList{
//    private var tasks : [Task] = []
//    
//    func addTask(_ title: String) {
//        for task in tasks {
//            if task.name == title{
//                print("Задача с таким названием уже существует.")
//                return
//            }
//        }
//        tasks.append(Task(name: title))
//    }
//    
//    
//    func removeTask(_ title: String){
//        tasks.removeAll{ task in
//            task.name == title
//        }
//    }
//    
//    func displayTasks(){
//        for task in tasks {
//            print("Название: " + task.name, "Состояние:", task.isCompleted)
//        }
//    }
//}
//
//let todo = TodoList()
//
//todo.addTask("W")
//todo.addTask("V")
//todo.displayTasks()
//
//
//struct Contact {
//    var firstName: String
//    var lastName: String
//    var phoneNumber: Int
//    var email: String
//}
//
//class AddressBook {
//    private var users: [Contact] = []
//    func addContact(_ firstName: String, _ lastName: String, _ phone: Int, _ email: String){
//        for user in users {
//            if user.email == email && user.phoneNumber == phone {
//                print("Пользователь существует")
//                return
//            }
//        }
//        users.append(Contact(firstName: firstName, lastName: lastName, phoneNumber: phone, email: email))
//    }
//    func removeContact(_ phone: Int){
//        users.removeAll { user in
//            user.phoneNumber == phone
//        }
//    }
//    func searchContact(_ firstName: String) -> Contact? {
//        for user in users {
//            if (user.firstName == firstName){ return user}
//        }
//        return nil
//    }
//    func updateContact(_ contact: Contact, _ newPhoneNumber: Int) -> Contact? {
//        if let index = users.firstIndex(where: {$0.phoneNumber == contact.phoneNumber}){
//            users[index].phoneNumber = newPhoneNumber
//            return users[index]
//        }
//        print("Контакт не найден")
//        return nil;
//    }
//    func displayContact(){
//        for u in users {
//            print(u.firstName + u.lastName + u.email,  u.phoneNumber)
//        }
//    }
//}
//
//var addressBook = AddressBook()
//
//addressBook.addContact("Alan", "Abzalkhanuly", 11112222, "alanabzalkhanuly05@gmail.com")
//addressBook.addContact("Beka", "Myrzakul", 22221111, "bekamyrzakul@gmail.com")
//addressBook.displayContact()
//print("-------")
//print(addressBook.updateContact(Contact(firstName: "Alan",lastName: "Abzalkhanuly",phoneNumber: 11112222, email: "alanabzalkhanuly05@gmail.com"), 1212))
//addressBook.removeContact(22221111)
//addressBook.displayContact()
//
//
//enum CALC: String {
//    case addition = "+"
//    case subtraction = "-"
//    case multiplication = "*"
//    case division = "/"
//}
//
//class Calculator{
//    func calculate(_ operation: CALC) -> Int?{
//        switch operation {
//                case .addition:
//                    return addition(5, 4)
//                case .subtraction:
//                    return subtraction(5, 4)
//                case .multiplication:
//                    return multiplication(21, 2)
//                case .division:
//                    return division(21, 2)
//                }
//    }
//    func addition(_ first: Int, _ second: Int) -> Int{
//        return first + second
//    }
//    func subtraction(_ first: Int, _ second: Int) -> Int{
//        return first - second
//    }
//    func multiplication(_ first: Int, _ second: Int) -> Int{
//        return first * second
//    }
//    func division(_ first: Int, _ second: Int) -> Int{
//            return first % second
//    }
//}
//
//var calculator = Calculator()
//
//print(calculator.calculate(.addition))
//print(calculator.calculate(.multiplication))
//print(calculator.calculate(.subtraction))
//print(calculator.calculate(.division))
//
//


struct Product {
    var title: String
    var price: Int
    var desc: String
    var date: Date
}

class Magaz {
    private var products: [Product] = []
    
    func addProduct(_ product: Product){
        products.append(Product(title: "Bread", price: 110, desc: "Хлэп", date: Date()))
    }
    func removeProduct(_ product: Product){
        products.removeAll(){ producted in
            producted.title == product.title
        }
    }
    func listProducts(){
        for product in products{
            print(product)
        }
    }
}

struct Player {
    var name: String
    var highScore: Int = 0
    var history: [Int] = []

    init(name name: String) {
        self.name = name
    }
}

var player = Player(name: "Tomas")

print(player.name)


//firstName: Your first name (String).
//• lastName: Your last name (String).
//• age: Your current age (Int).
//• birthYear: The year you were born (Int).
//• isStudent: Whether or not you are currently a student (Bool).
//• height: Your height in meters (Double).

var firstName: String = "Alan"
var lastName: String = "Abzalkhanuly"
var age: Int = 19
var birthYear: Int = 2005
var isStudent: Bool = true
var height: Double = 180.00
let currentYear: Int = 2024

print("My age by subsctracting = \(currentYear - birthYear)")
//hobby: Your favorite hobby (String).
//• numberOfHobbies: The total number of hobbies you have (Int).
//• favoriteNumber: Your favorite number (Int).
//• isHobbyCrea&ve: Whether your hobby is crea4ve (Bool).

var hobby: String = "Doing some sport"
var numberOfHobbies: Int = 2
var isHobbyCreative: Bool = false

print("My name is \(firstName) \(lastName). I am \(age) years old, born in \(birthYear). I am currently a student. I enjoy \(hobby), which a creative hobby. I have \(numberOfHobbies) hobbies in total, and my favorite number is 7.")

func futureGoals() -> String {
    let 😂: String = "iOS developer"
    return "In the future, I want to become a professional \(😂)"
}

print(futureGoals())

