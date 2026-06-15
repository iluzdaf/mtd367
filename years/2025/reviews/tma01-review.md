---
marp: true
theme: gaia
class: invert
paginate: true
---

# MTD367 TMA01

## Question 1(a): Arrays vs Dictionaries in Swift

- Show iteration
- Show safe access

---

|Array|Dictionary|
|-----|----------|
|Ordered Sequence| Unordered key-value store|
|Duplicates allowed| Keys unique, values can duplicate|
|Access by integer index|By key (must be hashable)|
|O(n) typical linear search|O(1) average for key lookup|
|Shopping cart where order and duplicates matter| Inventory where fast access by ID or name matters|

---

## Question 1(b): Palindrome function

- Write a function
- Return bool
- Include reasonable amount of test cases

---

## Question 2: Food delivery app data

- Use Decimal for price: Rounding, Display with 2 decimal point precision
- Explain orderID: String vs Int vs UUID
- items as Tuple or struct is ok
- Use date (Foundation framework) as deliveryDate
  - Can delivery date change? Must every order have a delivery date?
- Use enum for OrderStatus. Why?
- Update status regression?

---

## Question 3(a): View, State, Navigation

- Real World Examples are sometimes missed

- View:
  - Declaritive description of UI
  - Lightweight struct value
  - What to draw given a current state
  - Automatic updates and organization
  - View modifiers

---

- State
  - @State stores local, view-owned mutable data
  - @State ensures the value persists across re-renders
  - Marking properties with @State lets SwiftUI manage their lifetime and trigger body updates when they change

---

- ObservableObject
  - A shared, reference-type model used across multiple views
  - Properties marked with @Published automatically notify observers on change
  - @ObservedObject → The model is passed in from elsewhere
  - @StateObject → when the view creates/owns the model

---

- NavigationStack
  - A container that manages a navigation path (stack of views)
  - Works with a NavigationPath for programmatic navigation and type-safe destinations
  - Keeps track of the user’s back/forward navigation automatically

---

- NavigationLink
  - A declarative way to create a tappable element that pushes a new view onto the NavigationStack
  - Can link by:
    - Destination view: NavigationLink("Label", destination: DetailView())
    - Value binding (with NavigationPath): NavigationLink(value: item)

---

## Question 3(b) & 3(c)

- No need for Login checking
- No need for SwiftData or CoreData
- Explain flow with a diagram
- Long Press Gesture with Animation feedback
- Multiple Navigation Stacks
