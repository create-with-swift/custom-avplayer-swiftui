//
//  custom_avplayer_swiftui.swift
//  custom-avplayer-swiftui
//
//  Created by Marco Falanga on 19/11/21.
//

import SwiftUI

@main
struct custom_avplayer_swiftui: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CustomPlayerView()
                    .navigationTitle("CustomVideoPlayer")
            }
        }
    }
}
