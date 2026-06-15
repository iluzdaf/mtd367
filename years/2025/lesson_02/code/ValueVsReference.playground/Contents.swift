import Foundation

// Value types:
// A copy is created every time you assign it to a new variable.
// Reference types:
// Multiple variables share the same instance in memory.

// When you copy a value type
var a = 5
var b = a
b = 10

// Changing b does NOT change a
print(a) // 5
print(b) // 10

// Why did I choose to use class for Deck?
// Deck should be a class because:
// - Deck represents a single shared object in the game.
// - Players all draw cards from the SAME deck.
// - If one card is dealt, it's removed from the deck for everyone.
// - Classes are REFERENCE TYPES:
//     - All variables pointing to the deck share the same instance.
//     - Changes made by one player affect the shared deck.
// - A struct would create a COPY each time it's passed around.
//     - Each player might accidentally get their own deck, which breaks the game logic.

class Deck {
    var cards: [String] = ["Ace", "King", "Queen"]
    
    func dealCard() -> String? {
        return cards.popLast()
    }
}

let originalDeck = Deck()
let copiedDeck = originalDeck

copiedDeck.dealCard()

originalDeck.cards
copiedDeck.cards

struct DeckStruct {
    var cards: [String] = ["Ace", "King", "Queen"]
    
    mutating func dealCard() -> String? {
        return cards.popLast()
    }
}

var originalDeckStruct = DeckStruct()
var copiedDeckStruct = originalDeckStruct

copiedDeckStruct.dealCard()

originalDeckStruct.cards
copiedDeckStruct.cards
