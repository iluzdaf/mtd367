import Foundation

// A class lets you create your own data type in Swift.
// - Groups related data together
// - Can have properties
//     - Classes can hold multiple properties of different types
// - Can have methods
// - Reference types
//     - Multiple variables can point to the same instance
// - Can support inheritance
//     - A class can inherit properties and methods from another class
// - Need to write your own initializer if you have custom logic

class Player {
    var name: String
    var balance: Int

    // Must define init
    init(name: String, balance: Int) {
        self.name = name
        self.balance = balance
    }
}

let player = Player(name: "Fadzuli", balance: 100)
