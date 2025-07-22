import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var score = 0
    let suits = ["♥️", "♦️", "♣️", "♠️"]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Score: \(score)")
                .font(.largeTitle)
                .frame(width: 300)
            
            Button("Add 1") {
                score += 1
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            HStack {
                ForEach(suits, id: \.self) { suit in
                    Text(suit)
                        .font(.largeTitle)
                        .padding()
                }
            }
        }
        .padding()
    }
}

PlaygroundPage.current.setLiveView(ContentView())
