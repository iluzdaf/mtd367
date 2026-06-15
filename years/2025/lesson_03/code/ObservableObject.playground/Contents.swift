import SwiftUI
import PlaygroundSupport
import Combine

// MARK: - Model
class CounterModel: ObservableObject {
    @Published var count = 0
}

// MARK: - View
struct CounterView: View {
    @ObservedObject var model = CounterModel()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Count: \(model.count)")
                .font(.largeTitle)
            
            Button("Increment") {
                model.count += 1
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .padding()
    }
}

// MARK: - Live Preview
PlaygroundPage.current.setLiveView(CounterView())
