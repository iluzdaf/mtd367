//
//  Deck.swift
//  Blackjack
//
//  Created by Fadzuli Said on 22/7/25.
//

struct Deck {
    private(set) var cards: [Card] = []

    init() {
        let suits = ["♠️", "♥️", "♦️", "♣️"]
        let ranks = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]
        cards = suits.flatMap { suit in
            ranks.map { rank in Card(rank: rank, suit: suit) }
        }.shuffled()
    }

    mutating func deal() -> Card? {
        cards.popLast()
    }
}
