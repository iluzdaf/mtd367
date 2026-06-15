//
//  Card.swift
//  Blackjack
//
//  Created by Fadzuli Said on 22/7/25.
//

struct Card: CustomStringConvertible {
    let rank: String
    let suit: String

    var value: Int {
        switch rank {
        case "A": return 11
        case "K", "Q", "J": return 10
        default: return Int(rank) ?? 0
        }
    }

    var description: String {
        "\(rank)\(suit)"
    }
}
