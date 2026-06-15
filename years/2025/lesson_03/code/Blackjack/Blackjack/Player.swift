//
//  Player.swift
//  Blackjack
//
//  Created by Fadzuli Said on 22/7/25.
//

import SwiftUI

class Player: ObservableObject {
    let name: String
    @Published var hand: [Card] = []
    @Published var isStanding = false
    @Published var message = ""

    var handValue: Int {
        var total = hand.reduce(0) { $0 + $1.value }
        var aceCount = hand.filter { $0.rank == "A" }.count

        while total > 21 && aceCount > 0 {
            total -= 10
            aceCount -= 1
        }

        return total
    }

    init(name: String) {
        self.name = name
    }

    func reset() {
        hand = []
        isStanding = false
        message = ""
    }
}
