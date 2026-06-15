import Foundation

// Text or words
let name: String = "Fadzuli"
let myString = ""
let count = myString.count
myString.uppercased()
myString.lowercased()
myString.isEmpty

// Whole numbers
var age: Int = 43
let sum = 2 + 3
let product = age * 2
var score = 0
score += 1
if (age > 42)
{
    "Hello grandpa!"
}

// Decimal numbers
let height: Double = 1.75
height.rounded()
height.rounded(.down)
let heightMessage = String(format: "%.2f", height)

var isStudent: Bool = false // Yes/No
if isStudent {
    "Welcome, student!"
}
isStudent.toggle()

// Simple Introduction Example
var intro = "Hi! My name is \(name). I am \(age) years old. My height is \(height) meters."

// Optionals let us handle missing data safely
var nickname: String? = nil // I may or may not have a nickname

nickname = "Fad"

// Printing the optional directly prints: Optional("Fad")
print(nickname)

// In a Playground, typing the variable name shows the value "Fad" directly in the sidebar
nickname

// In order to use nickname,
// You need to unwrap the nickname safely
// Safely means checking if your optional has a value before using it
// If you try to use it without checking, your program might crash
if let shortName = nickname {
    intro += " My friends call me \(shortName)."
}
else {
    intro += " I have no friends."
}

intro
