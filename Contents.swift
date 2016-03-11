//: Playground - noun: a place where people can play

import UIKit

// 变量

var myVariable = 42
myVariable = 50
let myConstant = 42
//myConstant = 50

// 字符串转换
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples + oranges) pieces of fruit."

// 数组和字典
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
//shoppingList += "dsasdad"
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

// 控制流
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if (number > largest) {
            largest = number
        }
    }
}
largest

var firstForLoop = 0
for i in 0...3 {
    firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
secondForLoop

var n = 2
while n < 100 {
    n = n * 2
}
n

var m = 2
repeat {
    m = m * 2
} while m < 100
m

// switch分支
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

// 可选类型
var optionalString: String? = "hello"
if (optionalString != nil) {
    optionalString == nil
}

var optionalName: String? = "John Appleseed"
var gretting = "Hello!"
if let name = optionalName { // 解包
    gretting = "Hello, \(name)"
}

// 函数
func greet(name1 name: String, day1 day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet(name1:"Bob", day1: "Tuesday")

func getGasPrices() -> (Double, Double, Double) {
    return (3.59, 3.69, 3.79)
}
var prices = getGasPrices()
let (first, _, _) = prices
first
prices.0

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

// 嵌套函数
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// 函数也可作为返回值，参数
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, condition:lessThanTen)

func swapTwoInts1(inout a: Int, inout b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
func swapTwoInts2(var a: Int, var b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts1(&someInt, b: &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

swapTwoInts2(someInt, b: anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

// 类class
class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    deinit {

    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Square: NamedShape {
    var sideLength: Double

    var perimeter: Double {
        get {
            return 4.0 * sideLength
        }
        set {
            sideLength = newValue / 4.0
        }
    }

    lazy var lazy_var: Int = {
        var lazy_var = 10
        return lazy_var
    }()

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    final func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5, name: "my test square")
test.area()
test.simpleDescription()

// 枚举
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let aceDescription = ace.simpleDescription()

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure... \(error)"
}

// 结构
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

//
protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}

var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription

// 扩展
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
7.simpleDescription

// 泛型
func swapTwoValues<T>(inout a: T, inout b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someString = 1
var anotherString = 2
let str = someString + anotherString
print("someString is now \(someString), and anotherString is now \(anotherString) \(str) ")
swapTwoValues(&someString, b: &anotherString)
//NSLog("someString is now %@, and anotherString is now %@", someString, anotherString)
print("someString is now \(someString), and anotherString is now \(anotherString) \(str) ")

