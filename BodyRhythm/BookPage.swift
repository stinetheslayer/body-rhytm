//
//  BookPage.swift
//  BodyRhythm
//
//  Created by Aziza Rahimova on 13/12/23.
//
import SwiftUI
import AVFoundation

struct BookPage: View {
    @State private var isPlaying = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var currentTime: TimeInterval = 0.0
    @State private var totalDuration: TimeInterval = 0.0
    @State private var selectedBookIndex: Int? = nil

    let audioBookTitles = ["Ikigai", "Mindset", "Rework", "Grit", "CrushIt", "The Secret"]

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color("Color1"),
                        Color("Color2"),
                        Color("Color3"),
                        Color("Color4")
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .edgesIgnoringSafeArea(.all)
                VStack{
                VStack(alignment: .center) {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(LinearGradient(
                            gradient: Gradient(colors: [
                                Color("Color5"),
                                Color("Color6")
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                            .opacity(0.6)
                        )
                        .frame(width: 350, height: 350) // Set your desired frame here
                    
                        .overlay(
                            VStack(spacing: 35) {
                                HStack(spacing: 0) {
                                    ForEach(0..<audioBookTitles.count / 2) { index in
                                        NavigationLink(
                                            destination: BookDetail(
                                                bookTitle: audioBookTitles[index],
                                                audioPlayer: $audioPlayer,
                                                isPlaying: $isPlaying,
                                                currentTime: $currentTime,
                                                totalDuration: $totalDuration
                                            )
                                            .onAppear {
                                                loadAudio(bookTitle: audioBookTitles[index])
                                            },
                                            tag: index,
                                            selection: $selectedBookIndex
                                        ) {
                                            BookButton(
                                                bookTitle: audioBookTitles[index],
                                                audioPlayer: $audioPlayer,
                                                isPlaying: $isPlaying,
                                                currentTime: $currentTime,
                                                totalDuration: $totalDuration
                                            )
                                        }
                                    }
                                }
                                
                                HStack(spacing: 0) {
                                    ForEach(audioBookTitles.count / 2..<audioBookTitles.count) { index in
                                        NavigationLink(
                                            destination: BookDetail(
                                                bookTitle: audioBookTitles[index],
                                                audioPlayer: $audioPlayer,
                                                isPlaying: $isPlaying,
                                                currentTime: $currentTime,
                                                totalDuration: $totalDuration
                                            )
                                            .onAppear {
                                                loadAudio(bookTitle: audioBookTitles[index])
                                            },
                                            tag: index,
                                            selection: $selectedBookIndex
                                        ) {
                                            BookButton(
                                                bookTitle: audioBookTitles[index],
                                                audioPlayer: $audioPlayer,
                                                isPlaying: $isPlaying,
                                                currentTime: $currentTime,
                                                totalDuration: $totalDuration
                                            )
                                        }
                                    }
                                }
                                
                                
                                
                            }
                            
                            
                                .padding(20)
                        )
                        .padding(20)
                        .shadow(radius: 5)
                        .position(x: 200, y: 200)
                }//
                    VStack{
                        
                        // Add Sleep Music Label
                        Text("Sleep Music")
                            .fontWeight(.bold)
                            .foregroundColor(Color("LabelColor"))
                            .font(.title)
                            .position(x: 100,y: 110)
                        
                        // Music View Button
                                           NavigationLink(
                                               destination: MusicView(),
                                               label: {
                                                   RoundedRectangle(cornerRadius: 15)
                                                       .fill(LinearGradient(
                                                           gradient: Gradient(colors: [
                                                               Color("Color5"),
                                                               Color("Color6")
                                                           ]),
                                                           startPoint: .topLeading,
                                                           endPoint: .bottomTrailing
                                                       )
                                                        .opacity(0.5)
                                                       )
                                                       .frame(width: 350, height: 60)
                                                       .overlay(
                                                           HStack {
                                                               Image("MusicPhoto")
                                                                   .resizable()
                                                                   .aspectRatio(contentMode: .fit)
                                                                   .frame(width: 30, height: 30)
                                                                   .cornerRadius(8)
                                                               
                                                               Text("Music Ambience")
                                                                   .foregroundColor(Color("LabelColor"))
                                                                   .font(.headline)
                                                                   .foregroundColor(.white)
                                                                   .multilineTextAlignment(.center)
                                                               
                                                               Spacer()
                                                               
                                                               Image(systemName: "play.circle.fill")
                                                                   .resizable()
                                                                   .aspectRatio(contentMode: .fit)
                                                                   .frame(width: 30, height: 30)
                                                                   .foregroundColor(.white)
                                                           }
                                                           .padding(10)
                                                       )
                                                       .shadow(radius: 5)
                                               }
                                           )
                                           .position(x: 200,y: 10)
                    }
            }
                
            }
            .navigationBarTitle("Audio Books")
        }
    }

    private func loadAudio(bookTitle: String) {
        guard let path = Bundle.main.path(forResource: bookTitle, ofType: "mp3", inDirectory: "AudioBooks") else {
            print("Audio file not found")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            totalDuration = audioPlayer?.duration ?? 0.0
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
        }
    }
}

struct BookButton: View {
    let bookTitle: String
    @Binding var audioPlayer: AVAudioPlayer?
    @Binding var isPlaying: Bool
    @Binding var currentTime: TimeInterval
    @Binding var totalDuration: TimeInterval

    var body: some View {
        NavigationLink(
            destination: BookDetail(
                bookTitle: bookTitle,
                audioPlayer: $audioPlayer,
                isPlaying: $isPlaying,
                currentTime: $currentTime,
                totalDuration: $totalDuration
            )
            .onAppear {
                loadAudio(bookTitle: bookTitle)
            }
        ) {
            VStack {
                Image(bookTitle)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .cornerRadius(8)

                Text(bookTitle)
                    .foregroundColor(Color("LabelColor"))
                    .font(.headline)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
            }
        }
        
    
        
    }

    private func loadAudio(bookTitle: String) {
        guard let path = Bundle.main.path(forResource: bookTitle, ofType: "mp3", inDirectory: "AudioBooks") else {
            print("Audio file not found")
            return
        }

        let url = URL(fileURLWithPath: path)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            totalDuration = audioPlayer?.duration ?? 0.0
        } catch {
            print("Error loading audio file: \(error.localizedDescription)")
        }
    }
}


struct BookRow: View {
    let bookTitle: String

    var body: some View {
        HStack {
            // Replace with your image
            Image(systemName: "book.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)

            Text(bookTitle)
                .font(.title)
                .foregroundColor(Color("LabelColor"))
               
        }
    }
}

struct BookPage_Previews: PreviewProvider {
    static var previews: some View {
        BookPage()
    }
}
