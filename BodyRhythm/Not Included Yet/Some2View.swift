//
//  Some2View.swift
//  BodyRhythm
//
//  Created by Homayoun Salimi Manjili on 12/12/23.
//

import SwiftUI
import AVKit

struct AudioPlayerView: View {
    @State private var player: AVPlayer?
    @State private var audioFileName: String
    @State private var isPlaying: Bool = false

    init(audioFileName: String) {
        self.audioFileName = audioFileName
        loadAudio()
    }

    func loadAudio() {
        if let audioURL = Bundle.main.url(forResource: audioFileName, withExtension: "mp3") {
            player = AVPlayer(url: audioURL)
        }
    }

    func togglePlay() {
        if isPlaying {
            player?.pause()
        } else {
            player?.play()
        }
        isPlaying.toggle()
    }

    var body: some View {
        VStack {
            HStack {
                Button {
                } label: {
                    Image(systemName: "backward.fill")
                        .font(.system(size: 30))
                }
                .padding()

                Button {
                    togglePlay()
                } label: {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .font(.system(size: 40))
                }

                Button {
                } label: {
                    Image(systemName: "forward.fill")
                        .font(.system(size: 30))
                }
                .padding()
            }
        }
    }
}

struct Some2View_Previews: PreviewProvider {
    static var previews: some View {
        AudioPlayerView(audioFileName: "Ikigai")
        AudioPlayerView(audioFileName: "audio1")
    }
}



