//  VideoPlayerView.swift
//  HIITFit
//  Created by Loi Ton on 1/27/26.

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoName: String
    var body: some View {
        if let url = Bundle.main.url(
            forResource: videoName,
            withExtension: "mp4") {
            VideoPlayer(player: AVPlayer(url: url))
            }
        else {
            Text("Couldn't find \(videoName).mp4")
                .foregroundStyle(.red)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(videoName: "squat")
    }
}
