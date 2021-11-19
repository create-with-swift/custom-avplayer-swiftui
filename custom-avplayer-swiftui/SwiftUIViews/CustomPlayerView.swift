//
//  CustomPlayerView.swift
//  custom-avplayer-swiftui
//
//  Created by Marco Falanga on 19/11/21.
//

import SwiftUI
import AVFoundation

struct CustomPlayerView: View {
    @StateObject private var playerVM = PlayerViewModel()
    @State private var playlist: [Media] = Media.playlist
    
    init() {
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
    }
    
    var body: some View {
        VStack {
            VStack {
                CustomVideoPlayer(playerVM: playerVM)
                    .overlay(CustomControlsView(playerVM: playerVM)
                             , alignment: .bottom)
                    .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
            }
            .padding()
            .overlay(playerVM.isInPipMode ? List(playlist) { media in
                Button(media.title) {
                    playerVM.setCurrentItem(media.asPlayerItem)
                }
            } : nil)
            
            Button(action: {
                withAnimation {
                    playerVM.isInPipMode.toggle()
                }
            }, label: {
                if playerVM.isInPipMode {
                    Label("Stop PiP", systemImage: "pip.exit")
                } else {
                    Label("Start PiP", systemImage: "pip.enter")
                }
            })
            .padding()
        }
        .padding()
        .onAppear {
            playerVM.setCurrentItem(playlist.first!.asPlayerItem)
            playerVM.player.play()
        }
        .onDisappear {
            playerVM.player.pause()
        }
    }
}
