import Foundation

// A struct is a way to create your own data type in Swift.
// - Groups related data together
// - Can have properties
//   - Structs can hold multiple properties of different types
// - Automatic Memberwise Initializer
// - Can have methods
// - Value type
//  - each copy is separate

enum Suit: String {
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
    case spades = "♠️"
}

struct Card {
    var rank: String
    var value: Int
    var suit: Suit

    func description() -> String {
        return "\(rank) of \(suit.rawValue)"
    }
}

let card = Card(rank: "Ace", value: 11, suit: .spades)

card.description()
