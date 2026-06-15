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

enum Suit: String, CaseIterable {
    case hearts = "♥️"
    case diamonds = "♦️"
    case clubs = "♣️"
    case spades = "♠️"
}

struct Card {
    let rank: Rank
    let suit: Suit
    
    var description: String {
        rank.rawValue + suit.rawValue
    }
}

class Deck {
    func dealCard() -> Card {
        let rank = Rank.allCases.randomElement()!;
        let suit = Suit.allCases.randomElement()!;
        return Card(rank: rank, suit: suit)
    }
}

class Player : ObservableObject {
    let name: String
    @Published var hand: [Card] = []
    @Published var stand: Bool
    
    init(name: String) {
        self.name = name
        self.stand = false
    }
    
    var handValue: Int {
        return hand.reduce(0) { sum, card in
            sum + card.rank.blackjackValue
        }
    }
    
    var cannotHit: Bool {
        handValue >= 21 || stand
    }
    
    var canHit: Bool {
        !cannotHit
    }
    
    func reset() {
        hand = []
        stand = false
    }
}

//struct ContentView: View {
//    let deck = Deck()
//    @StateObject var player1 = Player(name: "Player 1")
//    @StateObject var player2 = Player(name: "Player 2")
//    
//    var body: some View {
//        VStack(spacing: 20) {
//            Text("🃏 Blackjack")
//                .font(.largeTitle)
//                .bold()
//            
//            playerView(player: player1)
//            playerView(player: player2)
//            
//            if (player1.canHit || player2.canHit) {
//                Text("Hello").opacity(0)
//            }
//            else if player1.handValue > 21 && player2.handValue > 21 {
//                Text("Both players busted. No winner!")
//            } else if player1.handValue  > 21 {
//                Text("Player 2 wins!")
//            } else if player2.handValue > 21 {
//                Text("Player 1 wins!")
//            } else if player1.handValue  > player2.handValue {
//                Text("Player 1 wins!")
//            } else if player2.handValue > player1.handValue {
//                Text("Player 2 wins!")
//            } else {
//                Text("It's a tie!")
//            }
//            
//            Button("New Game"){
//                startNewGame()
//            }.opacity(player1.cannotHit && player2.cannotHit ? 1 : 0)
//        }
//        .padding()
//            .frame(width:320, height: 480)
//            .onAppear {
//                startNewGame()
//            }
//    }
//    
//    @ViewBuilder
//    func playerView(player: Player) -> some View {
//        Text(player.name).font(.title2).bold()
//        
//        var message = player.handValue > 21 ? "💥 Bust" : player.handValue == 21 ? "🎉 Blackjack" : ""
//        
//        Text("\(player.handValue) \(message)")
//        
//        HStack {
//            ForEach(player.hand.indices, id: \.self) { index in
//                Text(player.hand[index].description)
//            }
//        }
//        
//        HStack {
//            Button("Hit") {
//                player.hand.append(deck.dealCard())
//            }.disabled(player.cannotHit)
//            
//            Button("Stand") {
//                player.stand = true;
//            }.disabled(player.cannotHit)
//        }
//    }
//    
//    func startNewGame() {
//        player1.reset()
//        player2.reset()
//        
//        for _ in 1...2 {
//            player1.hand.append(deck.dealCard())
//            player2.hand.append(deck.dealCard())
//        }
//    }
//}
//
//PlaygroundPage.current.setLiveView(ContentView())
