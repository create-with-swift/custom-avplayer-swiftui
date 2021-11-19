//
//  Media.swift
//  custom-avplayer-swiftui
//
//  Created by Marco Falanga on 19/11/21.
//

import Foundation
import AVFoundation

struct Media: Identifiable {
    let id = UUID()
    let title: String
    let url: String
}

extension Media {
    var asPlayerItem: AVPlayerItem {
        AVPlayerItem(url: URL(string: url)!)
    }
    
    static var playlist: [Media] = [
        .init(title: "First video", url: "URL_TO_FIRST_VIDEO.m3u8"),
        .init(title: "Second video", url: "URL_TO_SECOND_VIDEO.mp4"),
        .init(title: "Third video", url: "URL_TO_THIRD_VIDEO.m3u8"),
        .init(title: "Fourth video", url: "URL_TO_FOURTH_VIDEO.m3u8"),
        .init(title: "Fifth video", url: "URL_TO_FIFTH_VIDEO.mp4")
        // ...
    ]
}
