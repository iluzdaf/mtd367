import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var name = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Enter your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()

            Text("Hello, \(name)!")
                .font(.title2)
        }
        .padding()
        .frame(width: 300)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
