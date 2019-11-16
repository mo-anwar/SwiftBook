import UIKit

// MARK:- Create a constant with an explicit type of Float and a value of 4.”
let implicitFloat: Float = 4

// MARK:- Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.
let label = "Hello Mohamed:- "
let widthLabel = label + "\(implicitFloat + 5)"

// MARK:- """
let quotattion = """
Here Is example to Use Quotaions,
we can add IntValue in String By this \(implicitFloat)
"""
// MARK:- “Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.”

//var optionalName: String? = "John Appleseed"
var optionalName: String? = nil
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello, else"
}

// MARK:- “Try removing the default case. What error do you get?”
// I Got :- Switch must be exhaustive "add Default case"
let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:
    print("Everything tastes good in soup.")
}

// MARK:- “Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.”

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]

var largest = 0
var kindLargest = ""
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            kindLargest = kind
        }
    }
}

// MARK:- Functions
// MARK:-  “Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.”

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")

func greet(person: String, lunch: String) -> String {
    return "Hello \(person), today’s \(lunch) is special."
}
greet(person: "Bob", lunch: "Eggs")

// MARK:- “Rewrite the closure to return zero for all odd numbers.”

var numbers = [20, 19, 7, 12]
let result = numbers.map({ (number: Int) -> Int in
    if number % 2 != 0{
        return 0
    }
    let result = 3 * number
    return result
})
print(result)

// MARK:- Classes
// MARK:- “Add a constant property with let, and add another method that takes an argument.”

class Shape {
    var numberOfSides = 0
    let constant = 5
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func simpleDescription(number: Int) -> String {
        return "A shape with \(number) sides."
    }
}

// MARK:- “Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.”

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Circle: NamedShape {
    var radius: Float
    
    init(radius: Float, name: String) {
        self.radius = radius
        super.init(name: name)
    }
    
    func area()-> Float {
        return radius * 2
    }
    
    override func simpleDescription() -> String {
        return "the Area is \(area())"
    }
}

// MARK:- enums
// MARK:- “Write a function that compares two Rank values by comparing their raw values.”

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func getLarget(firstRank: Rank, secRank: Rank)-> Rank {
        return firstRank.rawValue > secRank.rawValue ? firstRank : secRank
    }
}

// MARK:- “Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.”

enum Suit {
    case spades, hearts, diamonds, clubs
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color()-> UIColor {
        switch self {
        case .spades, .clubs:
            return .black
        case .hearts, .diamonds:
            return .red
        }
    }
}
// MARK:- “Add a third case to ServerResponse and to the switch.

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case unKnown
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case .unKnown:
    print("Un Known Response")
}
// MARK:-  Struct
// MARK:- “Write a function that returns an array containing a full deck of cards, with one card of each combination of rank and suit.”

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    func creatFullDeck()-> [Card] {
        var cards = [Card]()
        for suit in [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs] {
            for rankNum in Rank.ace.rawValue...Rank.king.rawValue {
                if let rank = Rank(rawValue: rankNum){
                    let card = Card(rank: rank, suit: suit)
                    cards.append(card)
                }
            }
        }
        return cards
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
threeOfSpades.creatFullDeck()

// MARK:- Protocols and Extensions
// MARK:- “Add another requirement to ExampleProtocol. What changes do you need to make to SimpleClass and SimpleStructure so that they still conform to the protocol?”
protocol ExampleProtocol {
    var simpleDescription: String { get }
    var simpleVar: Int { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleVar: Int = 0
    
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleVar: Int
    
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure(simpleVar: 0)
b.adjust()
let bDescription = b.simpleDescription

// MARK:- “Write an extension for the Double type that adds an absoluteValue property.”

extension Double {
    func absoluteValue() -> Double {
        if self < 0 {
            return -self
        } else {
            return self
        }
    }
}

let count: Double = -14.0
count.absoluteValue()

// MARK:- Error Handling

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

// MARK :- Genircs

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
    where T.Element: Equatable, T.Element == U.Element {
        return lhs.map { $0 } + rhs.map { $0 }
}
anyCommonElements([1, 2, 3], [3])

