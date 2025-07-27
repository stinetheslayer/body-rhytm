//
//  BookView.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 14/12/23.
//

import SwiftUI
import AVFAudio

struct BookDetail: View {
    let bookTitle: String
    @Binding var audioPlayer: AVAudioPlayer?
    @Binding var isPlaying: Bool
    @Binding var currentTime: TimeInterval
    @Binding var totalDuration: TimeInterval

    @State private var timer: Timer?

    var body: some View {

        LinearGradient(
            gradient: Gradient(colors: [
                Color("Color1"),
                Color("Color2"),
                Color("Color3"),
                Color("Color4")
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .edgesIgnoringSafeArea(.all)
        .overlay(
            VStack(spacing: 50) {
                Image(bookTitle)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 300, height: 400)

                Text(bookTitle)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("LabelColor"))

                ProgressBar(value: CGFloat(currentTime / totalDuration), currentTime: currentTime, totalDuration: totalDuration, audioPlayer: $audioPlayer)

                HStack(spacing: 40) {
                    Button(action: { skip(seconds: -15) }) {
                        Image(systemName: "gobackward.15")
                            .font(.system(size: 50))
                            .foregroundColor(Color(.label))
                    }

                    Button(action: {
                        if isPlaying {
                            pause()
                        } else {
                            play()
                        }
                    }) {
                        Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                            .font(.system(size: 50))
                            .foregroundColor(Color(.label))
                    }

                    Button(action: { skip(seconds: 15) }) {
                        Image(systemName: "goforward.15")
                            .font(.system(size: 50))
                            .foregroundColor(Color(.label))
                    }
                }


            }
            .onAppear {
                startTimer()
            }
            .onDisappear {
                stopTimer()
                stop()
            }
            .onReceive(Timer.publish(every: 1, on: .main, in: .common).autoconnect()) { _ in
                updateProgress()
            }
        )
    }
    

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            updateProgress()
        }
    }

    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func updateProgress() {
        guard let player = audioPlayer else { return }
        currentTime = player.currentTime
    }

    private func play() {
        audioPlayer?.play()
        isPlaying = true
    }

    private func pause() {
        audioPlayer?.pause()
        isPlaying = false
    }

    private func stop() {
        audioPlayer?.stop()
        audioPlayer = nil
        isPlaying = false
    }

    private func skip(seconds: TimeInterval) {
        guard let player = audioPlayer else { return }
        let newTime = max(0, min(player.currentTime + seconds, player.duration))
        player.currentTime = newTime
        currentTime = newTime
    }

    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}

struct ProgressBar: View {
    var value: CGFloat
    var currentTime: TimeInterval
    var totalDuration: TimeInterval
    @Binding var audioPlayer: AVAudioPlayer?

    @State private var dragValue: CGFloat = 0.0

    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: geometry.size.width - 60, height: 10) // Subtract 80 for 40 pixels on each side
                        .opacity(0.3)
                        .foregroundColor(Color.white)
                        .cornerRadius(2)

                    Rectangle()
                        .frame(width: min(self.value * (geometry.size.width - 60), geometry.size.width - 60), height: 8) // Subtract 80 for 40 pixels on each side
                        .foregroundColor(Color.black)
                        .cornerRadius(2)

                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.black)
                        .offset(x: (self.value + dragValue) * (geometry.size.width - 60) - 5) // Offset to position the circle
                        .gesture(
                            DragGesture()
                                .onChanged { value in
                                    let dragPercentage = value.location.x / geometry.size.width
                                    dragValue = dragPercentage - self.value
                                }
                                .onEnded { _ in
                                    // Update the audio player's currentTime based on the drag
                                    guard let player = audioPlayer else { return }
                                    let newTime = max(0, min(player.duration, player.duration * Double(self.value + dragValue)))
                                    player.currentTime = newTime
                                    dragValue = 0.0
                                }
                        )
                }

                HStack {
                    Text(formatTime(currentTime))
                        .foregroundColor(Color(.label))
                        .font(.caption)
                        .fontWeight(.semibold)

                    Spacer()

                    Text(formatTime(totalDuration))
                        .fontWeight(.semibold)
                        .foregroundColor(Color(.label))
                        .font(.caption)
                }
            }
            .offset(x: 0) // Center the entire ProgressBar within the screen
        }
    }

    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}



