import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    let fruits = (1...50).map { "Fruit \($0)" }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                        .padding()
                        .background(Color.yellow.opacity(0.3))
                        .cornerRadius(8)
                }
            }
            .padding()
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
