//
//  SoundManager.swift
//  Todo
//
//  Created by Fadzuli Said on 25/7/25.
//

import AVFoundation

class SoundManager: ObservableObject {
    private var completePlayer: AVAudioPlayer?

    init() {        
        loadSounds()
    }

    private func loadSounds() {
        guard let url = Bundle.main.url(forResource: "Complete", withExtension: "wav") else {
            print("Sound file not found")
            return
        }

        do {
            completePlayer = try AVAudioPlayer(contentsOf: url)
            completePlayer?.prepareToPlay()
        } catch {
            print("Error loading sound: \(error)")
        }
    }

    func playComplete() {
        completePlayer?.stop()
        completePlayer?.currentTime = 0
        completePlayer?.play()
    }
}
