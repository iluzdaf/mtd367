//
//  ContentView.swift
//  Blackjack
//
//  Created by Fadzuli Said on 22/7/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var player1 = Player(name: "Player 1")
    @StateObject private var player2 = Player(name: "Player 2")
    @State private var deck = Deck()

    var body: some View {
        VStack(spacing: 20) {
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
        .onAppear(perform: startNewGame)
    }

    func startNewGame() {
        deck = Deck()
        player1.reset()
        player2.reset()
        dealInitialCards()
    }

    func dealInitialCards() {
        [player1, player2].forEach { player in
            for _ in 0..<2 {
                if let card = deck.deal() {
                    player.hand.append(card)
                }
            }
        }
    }

    func playerView(player: Player) -> some View {
        VStack(spacing: 10) {
            Text(player.name)
                .font(.title2)
                .bold()

            HStack {
                ForEach(player.hand.indices, id: \.self) { index in
                    Text(player.hand[index].description)
                        .padding()
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(8)
                }
            }

            Text("Total: \(player.handValue)")
                .font(.headline)

            Text(player.message)
                .foregroundColor(.red)
                .frame(height: 20)

            HStack {
                Button("Hit") {
                    if let card = deck.deal() {
                        player.hand.append(card)
                        if player.handValue > 21 {
                            player.message = "Busted!"
                            player.isStanding = true
                        }
                    }
                }
                .disabled(player.isStanding || player.handValue >= 21)

                Button("Stand") {
                    player.isStanding = true
                    player.message = "Stands with \(player.handValue)"
                }
                .disabled(player.isStanding)
            }
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
        .cornerRadius(12)
    }
}


#Preview {
    ContentView()
}
