---
marp: true
theme: gaia
class: invert
paginate: true
---

# 🚀 MTD 367 iOS Application Development

- ~~Lesson #1 - Building Apps That Matter and Swift~~
- ~~Lesson #2 - Dealing With Swift Types And SwiftUI~~
- **Lesson #3 - Doubling Down On SwiftUI  (Today)**
- Lesson #4 - All To-Do With SwiftData (1/9/2025)
- Lesson #5 - Streaming Multimedia Swiftly (8/9/2025)
- Lesson #6 - Putting The Map On Your App (15/9/2025)

---

## ❓ Questions About Lesson #2

- More Swift Language Features
  - Data: `enum`, `Struct`, `Class`, `Closure`, `Set`, `Dictionary`
    - Protocol: `CaseIterable`, Control Statments: `switch`
  - Value Types vs Reference Types
- SwiftUI Basics
  - What Is `@State` And How SwiftUI Updates The View?
  - Views: `Text`, `Button`, `ForEach`, `ScrollView`
    - Containers: `HStack`, `VStack`
    - Modifiers: `.font(.title2)`, `.background(.blue)`, `.padding()`

---

## ❓ Questions About Virtual Lab #2

Keep improving your Blackjack UI!

---

## ✅ Today’s Agenda

- ☐ More SwiftUI Features

---

## More SwiftUI Features

## 🌟 SwiftUI Feature Cheat Sheet

| SwiftUI Feature      | Details                                         |
|-----------------------|------------------------------------------------|
| **📋 List**           | Displays a scrollable list of rows             |
| **🖱 ScrollView**     | Makes content scrollable                       |
| **✍️ TextField**      | Lets users type text                           |
| **🤏 Gestures**       | Detects user interactions like tap, drag, etc. |
| **✨ Animations**     | Animates changes in views                      |
| **🗺️ NavigationStack**| Enables navigation between screens             |

---

## ☠️ RIP Playground

![Dancing Pallbearers](https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExZmZhN3FxNTE1ODg2anhzcHQ4cDY1endxcXhyY3p3cWVldjBpdzBodSZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/j6ZlX8ghxNFRknObVk/giphy.gif)

<!-- _notes: 
Create a project (Product name, interface, language)
App Structure (YourApp.swift, ContentView.swift, @main, The App Protocol, WindowGroup)
Run the simulator
Push navigation, Back button
-->

---

## 🃏  Hands-On #5

Improve your Blackjack App!

Now that you are working in a dedicated project, how would you setup your project?

---

## ✅ Summary

- ✅ More SwiftUI Features
  - Views: `List`, `TextField`, `NavigationStack`
  - View Modifiers: Gestures, Animations
- ✅ Setting up a Project
- ✅ Testing in simulator

---

## ⚠️ Reminder that TMA 1 is due on 25/8/2025

---

## 🃏  Virtual Lab #3

Keep improving your Blackjack App!

---

## ❓ Questions?

I’d love to hear how the class went or how I can improve.

Feel free to email me at:  
<muhammadfadzuli001@suss.edu.sg>

📂 All course materials are available at:  
[www.github.com/iluzdaf/mtd367](https://www.github.com/iluzdaf/mtd367)

---

## 📎 Appendix

### 📋 `ForEach` vs `List`

ForEach is not scrollable.

```swift
VStack {
    ForEach(items, id: \.self) { item in
        Text(item)
    }
}

List(items, id: \.self) { item in
    Text(item)
}
```

---

### 🗂️ `List`

- Built-in scroll
- Row separators
- Better performance with large data

```swift
let fruits = ["Apple", "Banana", "Orange"]

List {
    ForEach(fruits, id: \.self) { fruit in
        Text(fruit)
    }
}
```

---

### `ScrollView`

```swift
ScrollView(.vertical) {
    VStack {
        ForEach(1...20, id: \.self) { i in
            Text("Item \(i)")
                .padding()
        }
    }
}

ScrollView(.horizontal) {
    HStack {
        ForEach(1...10, id: \.self) { i in
            Rectangle()
                .fill(.blue).frame(width: 100, height: 100)
                .overlay(Text("\(i)").foregroundColor(.white))
        }
    }
}
```

---

### ✍️ `TextField`

Lets users type text into your app.

```swift
@State private var name = ""

TextField("Enter your name", text: $name)
    .textFieldStyle(.roundedBorder)

Text("Hello, \(name)!")
```

---

### 🤏👆 Gestures

SwiftUI makes it easy to detect user gestures!

- Tap
- Long press
- Drag
- Swipe
- Pinch

---

```swift
Text("Tap Me!")
    .onTapGesture {
        print("Tapped!")
    }

Text("Hold Me")
    .onLongPressGesture {
        print("Long pressed!")
    }

@State private var offset = CGSize.zero

Rectangle()
    .frame(width: 100, height: 100)
    .offset(offset)
    .gesture(
        DragGesture()
            .onChanged { value in
                offset = value.translation
            }
    )
```

---

### ✨ Animations

SwiftUI makes animations easy!

- Animate changes in:
  - Size
  - Position
  - Color
  - Opacity
- Just add `.animation(...)` or `withAnimation { }`

---

```swift
@State private var scale = 1.0

Circle()
    .scaleEffect(scale)
    .onTapGesture {
        scale += 0.5
    }
    .animation(.easeInOut, value: scale)

@State private var isRed = false

Rectangle()
    .fill(isRed ? Color.red : Color.blue)
    .frame(width: 100, height: 100)
    .onTapGesture {
        withAnimation {
            isRed.toggle()
        }
    }
```

---

### 🗺️ `NavigationStack`

`NavigationStack` lets your app navigate **between screens**.

- Helps users move:
  - Forward → push a new view
  - Back → pop to previous view
  - Back button automatically added by SwiftUI

---

```swift
NavigationStack {
    VStack {
        Text("Home Screen")
        NavigationLink("Go to Detail") {
            Text("Detail Screen")
        }
    }
}

// Send data to the next view
NavigationLink("Show User") {
    UserView(name: "Fadzuli")
}

```
