//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Igor Khrupin on 7/23/22.
//

import UIKit
import AVKit
import UIKit

class ViewController: UIViewController, AVPlayerViewControllerDelegate {
    
    var videoPlayer: AVPlayerViewController!
    
    @IBOutlet weak var image: UIImageView!
    let url = URL(string: "https://archive.org/download/Flickr-4876582888/Yellowstone_Geyser-4876582888.mp4")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let thumbnailImage = getThumbnailImage(forUrl: self.url!) {
            image.image = thumbnailImage
        }
    }
    
    func playVideo(forUrl url: URL) {
        let player = AVPlayer(url: url)
        
        videoPlayer = AVPlayerViewController()
        videoPlayer.delegate = self
        videoPlayer.player = player
        videoPlayer.allowsPictureInPicturePlayback = true
        videoPlayer.player?.play()
        
        present(videoPlayer, animated: true, completion: nil)
    }
    
    func getThumbnailImage(forUrl url: URL) -> UIImage? {
        let asset: AVAsset = AVAsset(url: url)
        let imageGenerator = AVAssetImageGenerator(asset: asset)

        do {
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 1, timescale: 60), actualTime: nil)
            return UIImage(cgImage: thumbnailImage)
        } catch let error {
            print(error)
        }

        return nil
    }
    
    func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("Video will started Picture In Picture")
    }
    
    func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("Video did started Picture In Picture")
    }


}

