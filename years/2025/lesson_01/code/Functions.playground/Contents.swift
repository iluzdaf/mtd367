// Hands-On #1 - Let's Change Our Introduction To A Function!

import Foundation

// When you define a Swift function, you can give your parameters external names to make your code read like a sentence.
// Easier to read
// Self-documenting
// Less error-prone

func introduce(withName name: String, andAge age: Int, andHeight height: Double, andNickname nickname: String?) -> String {
    var intro = "Hi! My name is \(name). I am \(age) years old. My height is \(height) meters."
    
    guard let shortName = nickname else {
        intro += " I have no friends"
        
        return intro
    }
    
    intro += " My friends call me \(shortName)."
    
    return intro
}

let name: String = "Fadzuli"
var age: Int = 43
let height: Double = 1.75
var isStudent: Bool = false
var nickname: String? = nil
nickname = "Fad"

introduce(withName: name, andAge: age, andHeight: height, andNickname: nickname)

// Shorter way to write if else statement
//if value1 > value2 {
//  return value1
//} else {
//  return value2
//}
// It has three parts (that’s why it’s called “ternary”)

func max(_ value1: Int, _ value2: Int) -> Int {
    return value1 > value2 ? value1 : value2
}

max (5, 10)
// max(value1: 5, value2: 10)
