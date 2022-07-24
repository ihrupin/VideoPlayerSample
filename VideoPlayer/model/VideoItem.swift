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
    case fish = "https://archive.org/download/fishisfish_20170601/fishisfish_20170601.mp4"
    case yellowstone = "https://archive.org/download/Flickr-4876582888/Yellowstone_Geyser-4876582888.mp4"
    case yosemite = "https://archive.org/download/YosemiteWonders/YosemiteWonders_512kb.mp4"
    case tahoelake = "https://archive.org/download/Flickr-32047076422/Lake_Tahoe-32047076422.mp4"
}

enum VideoTitles: String, CaseIterable {
    case fish = "Fish Is Fish"
    case yellowstone = "Yellowstone Geyser"
    case yosemite = "Yosemite Wonders"
    case tahoelake = "Lake Tahoe"
}
