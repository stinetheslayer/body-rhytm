//
//  MusicView.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 17/12/23.
//

import SwiftUI
import AVFoundation

struct MusicView: View {
    @State private var audioPlayer: AVAudioPlayer?
    @State private var isPlaying = false

    var body: some View {
        VStack {
            Button(action: {
                if isPlaying {
                    audioPlayer?.stop()
                } else {
                    playAudio()
                }
                isPlaying.toggle()
            }) {
                Image(systemName: isPlaying ? "stop.circle" : "play.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
            }

            Text("Hello, World!")
        }
    }

    private func playAudio() {
        guard let url = Bundle.main.url(forResource: "sleep1", withExtension: "mp3") else {
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }
}

struct MusicView_Previews: PreviewProvider {
    static var previews: some View {
        MusicView()
    }
}
