//
//  VideoItem.swift
//  VideoPlayer
//
//  Created by Igor Khrupin on 7/23/22.
//

import Foundation

class VideoItem {
    var title: String
    var url: String

    init(title: String, url: String) {
        self.title = title
        self.url = url
    }
}

enum VideoUrls: String, CaseIterable {
    case vid1 = "https://archive.org/download/popeye_shuteye_popeye/popeye_shuteye_popeye_512kb.mp4"
    case vid2 = "https://archive.org/download/popeye_i_dont_scare/popeye_i_dont_scare_512kb.mp4"
    case vid3 = "https://archive.org/download/Jolly_Fish_1932/Tom_and_Jerry_Jolly_Fish_1932_512kb.mp4"
    case vid4 = "https://archive.org/download/popeye_fright_to_the_finish/popeye_fright_to_the_finish_512kb.mp4"
}

enum VideoTitles: String, CaseIterable {
    case vid1 = "Shuteye Popeye"
    case vid2 = "Popeye: I Don't Scare"
    case vid3 = "Tom and Jerry: Jolly Fish"
    case vid4 = "Popeye: Fright To The Finish"
}
