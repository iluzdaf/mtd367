---
marp: true
theme: gaia
class: invert
paginate: true
---

# 🚀 MTD 367 iOS Application Development

---

## 👋 Introduction

- Fadzuli
- Masters in Entertainment Technology, Carnegie Mellon Univeristy
- 14 years in the gaming industry
  - 🐭 Disney
  - 👑 King
  - 🐻 Mighty Bear Games

<!-- _notes:
MET, CMU, Pittsburgh, PA

Disney - Pirates of the Caribean Online
King - Candy Crush
Mighty Bear Games - Local startup where I was a co-founder and CTO
-->

---

## 📚 Course Outline

- **Lesson #1 - Building Apps That Matter & Swift (Today)**
- Lesson #2 - Dealing With Swift Types & SwiftUI (11/8/2025)
- Lesson #3 - Doubling Down On SwiftUI (18/8/2025)
- Lesson #4 - All To-Do With SwiftData (1/9/2025)
- Lesson #5 - Streaming Multimedia Swiftly (8/9/2025)
- Lesson #6 - Putting The Map On Your App (15/9/2025)

---

### 🧪 Virtual Labs

- 🃏 Blackjack
  - Virtual Lab #1 (9/8/2025)
  - Virtual Lab #2 (16/8/2025)
  - Virtual Lab #3 (23/8/2025)
- 🗒️ To-Do List App
  - Virtual Lab #4 (6/8/2025)
  - Virtual Lab #5 (13/9/2025)
  - Virtual Lab #6 (20/9/2025)

---

## ✅ Today’s Agenda

- ☐ Course Objectives & Expectations
- ☐ What Is Swift & Why It Matters?
- ☐ Basic Swift Language Features

---

## Course Objectives & Expectations

- Expect basic programming knowledge
- No Swift experience required
- Git/GitHub not required but helpful

---

### 🎯 Grading Breakdown

| Assessment | Weight | Due Date   |
|------------|--------|------------|
| TMA 1      | 15%    | 25/8/2025  |
| TMA 2      | 15%    | 22/9/2025  |
| ECA        | 70%    | 14/10/2025 |

---

### 👩‍💻 Online Learning

- Use emoji reactions on Zoom 👍 👎 🫣
  - Helps me know if I should explain topics further
- Ask questions in the Zoom chat anytime
- Participate in activities and polls
- Need help after class?
  - Email me: <muhammadfadzuli001@suss.edu.sg>
  - I’ll reply within 24 hours

---

### 💬 How To Ask For Help

✅ **Good questions are:**

- Clear and specific
- Explain what you’ve tried
- Include code snippets
  - Share using GitHub gist
- Describe:
  - What you expected
  - What actually happened

---

### ✅ Good Example #1

> “I’m trying to load an image using UIImage(named:) but it keeps returning nil. Here’s the code I’m using.
>
>```swift
>let image = UIImage(named: "background.png")
>```
>
> The image is in my Xcode project under Assets.xcassets. I expected it to display on screen, but nothing shows up. What could be wrong?”

---

### ✅ Good Example #2

> “I’m animating a falling shape in SwiftUI using an explicit animation:
>
>```swift
> withAnimation(.linear(duration: 1.0)) {
>     yOffset = -300
> }
>```
>
> But the shape only moves partway down the screen instead of fully reaching the target offset. I expected it to end at -300, but it stops around -150. What could be causing this?”

---

### ❌ Bad Examples

> My code doesn’t work. Help.

💀💀💀

> Can someone fix my whole project?

---

### 🤖 My Stance On AI

- **Use it!**
- Understand what AI is suggesting
  - But adapt it into code you can read and understand
- ⚠️ AI “cheats”
  - Be Critical of AI
  - Sometimes AI gives incorrect or incomplete answers
  - Recognizing bad AI output is a skill

<!-- _notes:
- AI researchers trained a game-playing agent and monitored its actions through an “action manifest.”  
- The AI learned it was being watched.  
- It replaced the manifest with the message:
- **“Nothing to see here.”**
- Even AI can try to hide how it thinks!
-->

---

### 🧠 This Course Is NOT…

❌ A Matrix-style download of all Swift knowledge.

<br>
<div style="display: flex; gap: 10px;">
  <img src="https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExMmU4aWJ4NjBidWl1MGR6ZWNwemJxdzdldWFuY3ZjaDM5azA2a2QzcSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/3o7btNhMBytxAM6YBa/giphy.gif" width="350"/>
  <img src="https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExeTk5YTUyeWdoNXR2eGVkcm15dGNydHdveGd0M2JoamxtODJrbWp0OCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/1GK2uXhGHcQ5G/giphy.gif" width="350"/>
  <img src="https://media0.giphy.com/media/v1.Y2lkPTc5MGI3NjExaHI4MjdnanNjMzRwbm5zOThiOXZob2xhZHNncDByaHVwdDdqZ2p4ciZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/ChkynEc2Y0f5e/giphy.gif" width="350"/>
</div>

---

### ✅ Instead…

- We’ll work through **hands-on examples**
- Learning Swift features only **when they’re relevant**
- My Teaching Style:
  - **Incrementalism:** Learn bit by bit
  - **Continuous Refactoring:** Improve code gradually
  - **Fail Fast:** Test quickly and learn from mistakes

---

### 🍎 macOS Requirement

- Swift is open source → can run on Linux, Windows.
- But:
  - **Xcode only runs on macOS.**
  - You need macOS to build iOS apps
- Our course focuses on iOS → you’ll need a Mac

<!-- _notes: 
- Consider **[MacinCloud](https://www.macincloud.com/)** if you don’t have physical access to a Mac.
- Allows you to use Xcode and build iOS apps remotely.
- Use **at your own risk** — I haven’t personally tested it.
-->

---

## 📜 What Is Swift & Why It Matters?

- Modern programming language from Apple
- Released in 2014
- Aims to:
  - Be safer than Objective-C
  - Be faster than interpreted languages
  - Replace C and C++ for Apple platforms

<!-- _notes:
Be safer than Objective-C
Swift helps catch bugs at compile time rather than runtime, and eliminates many risky programming practices that were common in Objective-C.

- Optionals make nil handling explicit
- Strong static typing
- Automatic memory safety
- Type-safe collections
- Immutable by default

Be faster than interpreted languages
Swift compiles to machine code, whereas interpreted languages run code line by line at runtime. Compiled code is much faster. 
Swift uses LLVM, the same compiler infrastructure used for C, C++ and Rust.

- Compiles to machine code
- No runtime interpreter needed
- LLVM optimizations
- Static typing = fewer runtime checks
- Efficient memory management
-->

---

### 👩‍💻 A Brief History

- Before Swift:
  - Apps were written in **Objective-C**
  - Verbose syntax and manual memory management
- Apple wants:
  - Safer code
  - Modern syntax
  - Cross-platform potential

<!-- _note 
NSString *name = @"Fadzuli";
let name = "Fadzuli"

NSArray *fruits = @[@"Apple", @"Banana", @"Durian"];
let fruits = ["Apple", "Banana", "Durian"]

NSDictionary *ages = @{
    @"Ali" : @25,
    @"Siti" : @30
};
let ages = [
    "Ali": 25,
    "Siti": 30
]

- (void)sendEmailTo:(NSString *)recipient
         withTitle:(NSString *)title
           message:(NSString *)body;
[self sendEmailTo:@"fadzuli@example.com"
        withTitle:@"Hello"
          message:@"How are you?"];
func sendEmail(to recipient: String, title: String, message: String) {
}
sendEmail(to: "fadzuli@example.com", title: "Hello", message: "How are you?")
-->
---

### 📱 Why Learn Swift?

- Mobile devices are everywhere!
- iOS users generally spend more on apps and in-app purchases
- High demand for skilled mobile developers
- 👓 Prepared for a possible future: AR & VR
  - Tech CEOs see AR and VR as the next big platform
  - **visionOS** → Swift works for building apps for Vision Pro

<!-- _notes:
Mobile devices are everywhere!
- Over **6.9 billion smartphone users** worldwide in 2025 (Source: Statista, GSMA Intelligence)
- **90%+ of internet users** access the web via mobile (DataReportal, 2024)
- People spend **4-5 hours daily** on mobile apps (Data.ai, 2024 Mobile Market Report)
- Mobile app revenue expected to hit **$613 billion USD** in 2025 (Statista, Data.ai projections)

iOS users generally spend more on apps and in-app purchases
- $12.77 per app spent by iPhone users on average — nearly double the $6.19 per app spent by Android users
- iOS accounts for 68% of global app revenue (~$102 B vs Android’s ~$48 B in 2024)
- Monthly app spend per iOS user: $10.40, compared to just $1.40 per Android user

High demand for skilled mobile developers
- The market is competitive:
    - Many junior devs → harder to stand out
- Companies sometimes prefer cross-platform tools to save costs
- AI tools are automating some basic coding tasks
	- But businesses still need skilled devs who can architect, debug, and ship production apps
- Demand is cyclical:
	- Booms during new tech (e.g. AR/VR, Vision Pro)
	- Softens during downturns

Tech CEOs see AR and VR as the next big platform
Tim Cook (Apple CEO)
“Augmented reality is the larger of the two [AR vs VR], probably by far.”
“[AR] gives the capability for both of us to sit and be very present, talking to each other, but also have other things — visually — for both of us to see.”

Mark Zuckerberg (Meta CEO)
He envisions AR glasses replacing smartphones by decade’s end, leveraging neural interfaces and AI overlays.
-->

---

### 💪 Build Local Solutions

- We shouldn’t rely only on big tech or foreign companies
- **Local developers understand local needs best**

<!-- _notes: 
China’s payments story:
- China didn’t simply adopt Visa/Mastercard everywhere
- Instead, local tech giants WeChat and Alipay built systems tailored to local behaviors:
	- People pay with QR codes, even street vendors
	- Deep integration into daily life — paying bills, buying movie tickets, social media tipping
- Why? Because:
	- Foreign systems were expensive and complex for small businesses
- Local developers understood:
	- How people prefer to pay
	- Which services to integrate (e.g. social apps)
	- Result: Today, over 90% of urban Chinese consumers use mobile payments regularly

PayNow
- Singapore’s banks collaborated to create PayNow, a real-time payment system using:
	- NRIC
	- Mobile numbers
	- UENs for businesses
- Solves:
	- Free peer-to-peer transfers
	- Instant payments
	- Local banks built it because global services like Venmo or Zelle don’t exist here

Parking.sg
- App built by the Singapore Government and local developers
- Replaced physical parking coupons with digital payments
- Uses:
	- Location services
	- Local vehicle database
	- Example of local devs solving a very Singapore-specific problem
-->

---

## 🔤 Basic Swift Language Features

| Swift Concepts            | Details                                       |
|---------------------------|-----------------------------------------------|
| **🔑 Variables**          | `let` → constant <br> `var` → variable        |
| **🧱 Data types**         | `String`, `Int`, `Double`, `Bool`, `Optional` |
| **🔀 Control Statements** | `if`/`else`, `for`, `guard`                   |
| **⚙️ Functions**          | How to define and call functions              |
| **🗂 Data structures**    | `Array`                                       |

---

### 🚀 Xcode

We will be looking at the above features and working on Hands-On #1 (Functions).

![Just Do It](https://media2.giphy.com/media/v1.Y2lkPTc5MGI3NjExb3ppM2E1bDY1dWI0bWxsd3hhdjJiOWplcW5waDJoMDluODNoenVpNyZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/UqZ4imFIoljlr5O2sM/giphy.gif)

---

## 🃏 Hands-On #2

Build a simple Blackjack game in Playground:

- Deal cards
- Calculate hand totals
- Determine hand value
  - Blackjack == 21
  - Busted > 21
- Add a second player
- Determined who won

<!-- _notes:
Remind students:
- Don't be afraid to experiment
- Save and test often
- Ask questions!
-->

---

## ✅ Summary

- ✅ Course Objectives & Expectations
- ✅ What Swift Is?
- ✅ Why They Matter?
- ✅ Basic Swift Language Features
  - Variables: `let`, `var`
  - Data types: `String`, `Int`, `Double`, `Bool`, `Optional`
  - Data structure: `Array`
  - Control Statments: `if`/`else`, `for`, `guard`

---

## Deep Dive on Swift if you have 7 hours

[Vandad's Full Swift Proramming Course for Beginners](https://www.youtube.com/watch?v=8Xg7E9shq0U)

---

## 🃏 Virtual Lab #1 (9/8/2025)

Blackjack doesn’t stop after the first two cards.

- Players can:
  - **Hit** → take another card
  - **Stand** → keep their current total
- Simulate choices with random decisions.
- The next hand starts once a winner has been determined for a single hand.

---

## ❓ Questions?

I’d love to hear how the class went or how I can improve.

Feel free to email me at:  
<muhammadfadzuli001@suss.edu.sg>

📂 All course materials are available at:  
[www.github.com/iluzdaf/mtd367](https://www.github.com/iluzdaf/mtd367)

---

## 📎 Appendix

### "Hello World"

```swift
import Foundation

var greeting = "Hello World"

print(greeting) // In a regular Xcode project, you’d need to print it:

greeting // In a Playground, you can simply type the variable name:

// Playgrounds automatically run your code each time you make changes, 
// so you can see your results instantly.
```

<!-- _notes: 
A Swift Playground is a special coding environment where you can:
- Write Swift code and see results immediately.
- Experiment, learn, and test small bits of code without creating a full app.
- View results in the Playground sidebar without needing to run the full app.

About `import Foundation`
- Brings in Apple’s Foundation framework.
- It gives you extra tools like:
  - Dates and times
  - Random numbers
  - Advanced String manipulation
  - Collections with more functionality
- You might not always need it for simple examples, but it’s widely used in real-world projects.

-->
---

### 🧱 `let` vs `var`

- **let**
  - Constant value
  - Cannot change after it’s set
- **var**
  - Variable value
  - Can change later

---

Prefer `let` by default

- If you don’t need to change it, make it a constant
  - Prevents accidental changes
  - Makes code safer and easier to understand
- Constants Improve Performance
  - The compiler can optimize code better if it knows values won’t change

---

```swift
let name = "Fadzuli"
name = "Ali" //❌

var age = 43
age = 44
age += 1

// Think of let as something fixed, and var as something flexible.
let city = "Singapore"
var temperature = 28
temperature = 30
// because weather changes!
```

---

### 🧱 `String`

```swift
// Text or words
let name: String = "Fadzuli"
let myString = ""
let count = myString.count
myString.uppercased()
myString.lowercased()
myString.isEmpty
```

---

### 🧱 `Int`

```swift
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
```

---

### 🧱 `Double`

```swift
// Decimal numbers
let height: Double = 1.75
height.rounded()
height.rounded(.down)
let heightMessage = String(format: "%.2f", height)
```

---

### 🧱 `Bool`

```swift
var isStudent: Bool = false // Yes/No
if isStudent {
    "Welcome, student!"
}
isStudent.toggle()
```

---

### 🧱 `Optional`

```swift
// Optionals let us handle missing data safely
var nickname: String? = nil // I may or may not have a nickname

// In order to use nickname,
// You need to unwrap the nickname safely
// Safely means checking if your optional has a value before using it
// If you try to use it without checking, your program might crash
if let shortName = nickname {
    " My friends call me \(shortName)."
}
else {
    " I have no friends."
}
```

---

### ⚙️ Functions

```swift
// When you define a Swift function, 
// you can give your parameters external names to make your code read like a sentence.
// Easier to read
// Self-documenting
// Less error-prone
func introduce(withName name: String, andAge age: Int, andHeight height: Double, andNickname nickname: String?) -> String {
  ...
}

// You can also do away with external names
func max(_ value1: Int, _ value2: Int) -> Int {
  ...
}
```

---

### 🔀 `if`/`else`

```swift
func max(_ value1: Int, _ value2: Int) -> Int {
  if value1 > value2 {
    return value1
  } else {
    return value2
  }
}

// or in tenary form
func max(_ value1: Int, _ value2: Int) -> Int {
  return value1 > value2 ? value1 : value2
}
```

---

### 🔀 `for`

```swift
func calculateHandValue(_ cards: [Int]) -> Int {    
    var total = 0
    for card in cards {
        total += card
    }   
    return total
}
```

---

### 🔀 `guard`

```swift
func introduce(
  withName name: String, andAge age: Int, 
  andHeight height: Double, 
  andNickname nickname: String?) -> String {
    var intro = "Hi! My name is \(name). I am \(age) years old. My height is \(height) meters."
    
    guard let shortName = nickname else {
        intro += " I have no friends"
        
        return intro
    }
    
    intro += " My friends call me \(shortName)."
    
    return intro
}
```

---

### 🗂 `Array`

```swift
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
```

---

```swift
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
```
