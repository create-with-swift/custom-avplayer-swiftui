//
//  CustomControlsView.swift
//  custom-avplayer-swiftui
//
//  Created by Marco Falanga on 19/11/21.
//

import SwiftUI

struct CustomControlsView: View {
    @ObservedObject var playerVM: PlayerViewModel
    
    var body: some View {
        HStack {
            if playerVM.isPlaying == false {
                Button(action: {
                    playerVM.player.play()
                }, label: {
                    Image(systemName: "play.circle")
                        .imageScale(.large)
                })
            } else {
                Button(action: {
                    playerVM.player.pause()
                }, label: {
                    Image(systemName: "pause.circle")
                        .imageScale(.large)
                })
            }
            
            if let duration = playerVM.duration {
                Slider(value: $playerVM.currentTime, in: 0...duration, onEditingChanged: { isEditing in
                    playerVM.isEditingCurrentTime = isEditing
                })
            } else {
                Spacer()
            }
        }
        .padding()
        .background(.thinMaterial)
    }
}
