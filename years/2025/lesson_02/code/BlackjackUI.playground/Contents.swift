// Hands-On #4 : BlackjackUI

import SwiftUI
import PlaygroundSupport

enum Rank: String, CaseIterable {
    case ace = "A"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case ten = "10"
    case jack = "J"
    case queen = "Q"
    case king = "K"
    
    var blackjackValue: Int {
        switch self {
        case .ace:
            return 11
        case .jack, .queen, .king:
            return 10
        default:
            return Int(self.rawValue) ?? 0
        }
    }
}

struct Card {
    let rank: Rank
    
    var description: String {
        rank.rawValue
    }
}

class Deck {
    func dealCard() -> Card {
        let rank = Rank.allCases.randomElement()!
        return Card(rank: rank)
    }
}

class Player: ObservableObject {
    let name: String
    @Published var hand: [Card] = []
    @Published var isStanding: Bool = false
    @Published var message: String = ""
    
    init(name: String) {
        self.name = name
    }
    
    var handValue: Int {
        return hand.reduce(0) { sum, card in
            sum + card.rank.blackjackValue
        }
    }
    
    func updateStatus() {
        if handValue == 21 {
            message = "🎉 Blackjack!"
            isStanding = true
        } else if handValue > 21 {
            message = "💥 Bust!"
            isStanding = true
        } else {
            message = ""
        }
    }
    
    func reset() {
        hand = []
        isStanding = false
        message = ""
    }
}

struct ContentView: View {
    @StateObject var player1 = Player(name: "Player 1")
    @StateObject var player2 = Player(name: "Player 2")
    
    let deck = Deck()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("🃏 Blackjack")
                .font(.largeTitle)
                .bold()

            playerView(player: player1)
            
            playerView(player: player2)
            
            Button("New Game") {
                startNewGame()
            }
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .onAppear {
            startNewGame()
        }
    }
    
    func startNewGame() {
        player1.reset()
        player2.reset()
        
        for _ in 1...2 {
            player1.hand.append(deck.dealCard())
            player2.hand.append(deck.dealCard())
        }
        
        player1.updateStatus()
        player2.updateStatus()
    }
    
    @ViewBuilder
    func playerView(player: Player) -> some View {
        VStack(spacing: 10) {
            Text(player.name)
                .font(.title2)
                .bold()
            
            HStack {
                ForEach(player.hand.indices, id: \.self) { index in
                    Text(player.hand[index].description)
                        .padding()
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(8)
                }
            }
            
            Text("Total: \(player.handValue)")
                .font(.headline)
            
            Text(player.message)
                .font(.headline)
                .foregroundColor(.red)
                .frame(height: 20)
            
            HStack {
                Button("Hit") {
                    let card = deck.dealCard()
                    player.hand.append(card)
                    player.updateStatus()
                }
                .disabled(player.isStanding || player.handValue >= 21)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Stand") {
                    player.isStanding = true
                    if player.message.isEmpty {
                        player.message = "Player stands with \(player.handValue)."
                    }
                }
                .disabled(player.isStanding)
                .padding()
                .background(Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(12)
    }
}

PlaygroundPage.current.setLiveView(ContentView())
