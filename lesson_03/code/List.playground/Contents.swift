import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    let fruits = (1...50).map { "Fruit \($0)" }

    var body: some View {
        List {
            ForEach(fruits, id: \.self) { fruit in
                Text(fruit)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
