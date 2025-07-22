import Foundation

// or enumeration is a way to group related values under a single type name
// You use it when a value must be one of several choices
// - Makes code clearer and safer
// - Prevents typos in strings
// - Helps the compiler check your logic

let lightString = "red"

if lightString == "red" {
    "Pedal to the metal!"
} else if lightString == "yellow" {
    "Go faster!"
} else if lightString == "green" {
    "Go!"
} else {
    print("Unknown color!")
}

enum TrafficLight {
    case red
    case yellow
    case green
}

let light = TrafficLight.red

switch light {
case .red:
    print("Stop!")
case .yellow:
    print("Slow down!")
case .green:
    print("Go!")
}

enum Suit: String, CaseIterable {
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
    case spades = "♠️"
}

let suit = Suit.hearts
suit.rawValue

switch suit {
case .hearts:
    print("You picked hearts ♥️")
case .diamonds:
    print("You picked diamonds ♦️")
case .clubs:
    print("You picked clubs ♣️")
case .spades:
    print("You picked spades ♠️")
}

// Map means: Transform each element into something else
// A closure in Swift is like a little chunk of code that you can pass around and run later

Suit.allCases.map ({ suit in
    suit.rawValue
})

// If the closure is the last argument of a function, you can move it outside the parentheses.

Suit.allCases.map { suit in
    suit.rawValue
}

// Key Path Shorthand
// \.rawValue → means “Get the property rawValue from each element.”

Suit.allCases.map(\.rawValue)
