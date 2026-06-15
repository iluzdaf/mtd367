import Foundation

// An Array is a Collection of values, all kept together in one variable.
// You can store many items of the same type—like a row of boxes side by side

var fruits: [String] = ["Apple", "Banana", "Durian"]

// Arrays are zero-indexed → first item is at index 0.
fruits[0]
fruits[2]

// Changing an element
fruits[1] = "Mango"
fruits

// Adding
fruits.append("Pineapple")

// Removing
fruits.remove(at: 2)
fruits

// Creating empty array
var cards = [Int]()
cards.append(11)
cards.append(10)

// Looping
func calculateHandValue(_ cards: [Int]) -> Int {    
    var total = 0
    
    for card in cards {
        total += card
    }
    
    return total
}

let handValue = calculateHandValue(cards)
if handValue == 21 {
    "Blackjack!"
}
else if handValue > 21 {
    "You busted!"
}
else {
    "Your hand value is \(handValue)."
}
