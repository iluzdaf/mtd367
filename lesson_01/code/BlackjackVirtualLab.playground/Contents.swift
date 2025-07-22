// Virtual Lab #1 Simple Blackjack

import Foundation

func dealCard() -> Int {
    return Int.random(in: 2...11)
}

var player1Hand = [dealCard(), dealCard()]
var player2Hand = [dealCard(), dealCard()]

func calculateHandValue(_ hand: [Int]) -> Int {
    return hand.reduce(0, +)
}

func printHand(_ playerName: String, _ hand: [Int]) -> String {
    var message = "\(playerName)'s hand: \(hand)\n"
    
    let total = calculateHandValue(hand)
    if total == 21 {
        message += "Blackjack!"
    } else if total > 21 {
        message += "Busted!"
    } else {
        message += "Hand value: \(total)"
    }
    
    message += "\n"
    
    return message
}

printHand("Player 1", player1Hand)
printHand("Player 2", player2Hand)

func shouldHit() -> Bool {
    return Bool.random()
}

while calculateHandValue(player1Hand) < 21 && shouldHit() {
    let newCard = dealCard()
    player1Hand.append(newCard)
}

while calculateHandValue(player2Hand) < 21 && shouldHit() {
    let newCard = dealCard()
    player2Hand.append(newCard)
}

printHand("Player 1", player1Hand)
printHand("Player 2", player2Hand)

let total1 = calculateHandValue(player1Hand)
let total2 = calculateHandValue(player2Hand)
let winner: String
if total1 > 21 && total2 > 21 {
    winner = "Both players busted. No winner!"
} else if total1 > 21 {
    winner = "Player 2 wins!"
} else if total2 > 21 {
    winner = "Player 1 wins!"
} else if total1 > total2 {
    winner = "Player 1 wins!"
} else if total2 > total1 {
    winner = "Player 2 wins!"
} else {
    winner = "It's a tie!"
}

"🏆 \(winner)"
