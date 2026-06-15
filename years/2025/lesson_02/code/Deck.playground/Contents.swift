// Hands-On #3 : Building a deck class
// Until now, our Blackjack game dealt random cards each time.
// But in a real deck, there are only 4 of each card.
// Let’s build a Deck class that:
// - Creates 52 unique cards.
// - Shuffles the cards.
// - Deals cards without repeats.

import Foundation

func dealCard() -> Int {
    return Int.random(in: 2...11)
}

enum Suit: String, CaseIterable {
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
    case spades = "♠️"
}

enum Rank: String, CaseIterable {
    case ace = "A"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
    
    var blackjackValue: Int {
        switch self {
        case .ace:
            return 11
        case .jack, .queen, .king:
            return 10
        default:
            return Int(self.rawValue) ?? 0
        }
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    
    var description: String {
        return "\(rank.rawValue) of \(suit.rawValue)"
    }
    
    var value: Int {
        return rank.blackjackValue
    }
}

class Deck {
    private var cards: [Card] = []
    
    init() {
        buildDeck()
        shuffle()
    }
    
    private func buildDeck() {
        cards.removeAll()
        for suit in Suit.allCases {
            for rank in Rank.allCases {
                let card = Card(rank: rank, suit: suit)
                cards.append(card)
            }
        }
    }
    
    func shuffle() {
        cards.shuffle()
    }
    
    func dealCard() -> Card? {
        return cards.popLast()
    }
    
    func remainingCards() -> Int {
        return cards.count
    }
}
