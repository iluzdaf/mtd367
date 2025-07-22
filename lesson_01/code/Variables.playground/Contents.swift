import Foundation

// 🔤 let vs var
//
// - **let**
//   - Constant value
//   - Cannot change after it’s set
//
// - **var**
//   - Variable value
//   - Can change later
let name = "Fadzuli"
//name = "Ali" //❌

var age = 43
age = 44
age += 1

// Think of let as something fixed, and var as something flexible.
let city = "Singapore"
var temperature = 28
temperature = 30
// because weather changes!

// Prefer `let` by default
// - If you don’t need to change it, make it a constant
//   - Prevents accidental changes
//   - Makes code safer and easier to understand
// - Constants Improve Performance
//   - The compiler can optimize code better if it knows values won’t change
