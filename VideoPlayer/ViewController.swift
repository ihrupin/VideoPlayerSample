//
//  ViewController.swift
//  VideoPlayer
//
//  Created by Igor Khrupin on 7/23/22.
//

import UIKit
import AVKit
import UIKit

class ViewController: UIViewController, AVPlayerViewControllerDelegate, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    let cellReuseIdentifier = "ListItem"
    
    var videoPlayer: AVPlayerViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? ListItem else { return  UITableViewCell() }
        
        cell.title.text = VideoTitles.allCases[indexPath.row].rawValue
        
        let urlString = VideoUrls.allCases[indexPath.row].rawValue
        cell.thumbnail.image = UIImage.gifImageWithName("loading")
        DispatchQueue(label: urlString).async { [self] in
           guard let url = URL.init(string: urlString) else {
                           return
                       }
           if let thumbnailImage = self.getThumbnailImage(forUrl: url) {
               DispatchQueue.main.async {
                   cell.thumbnail.image = thumbnailImage
               }
           }
       }
             
            return cell
        }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VideoUrls.allCases.count
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
            let thumbnailImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 40, timescale: 1), actualTime: nil)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = URL.init(string: VideoUrls.allCases[indexPath.row].rawValue) else {
                        return
                    }
        
        playVideo(forUrl: url)
    }


}

