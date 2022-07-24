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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onClick(_ sender: UIButton) {
        playVideo()
    }
    
    func playVideo() {
        guard let url = URL(string: "https://archive.org/download/Flickr-4876582888/Yellowstone_Geyser-4876582888.mp4") else { return }
        
        let player = AVPlayer(url: url)
        
        videoPlayer = AVPlayerViewController()
        videoPlayer.delegate = self
        videoPlayer.player = player
        videoPlayer.allowsPictureInPicturePlayback = true
        videoPlayer.player?.play()
        
        present(videoPlayer, animated: true, completion: nil)
    }
    
    func playerViewControllerWillStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("Video will started Picture In Picture")
    }
    
    func playerViewControllerDidStartPictureInPicture(_ playerViewController: AVPlayerViewController) {
        print("Video did started Picture In Picture")
    }


}

