//
//  VideoVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 08/06/1443 AH.
//
//
import AVKit
import AVFoundation
import UIKit

class VideoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .white

//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("رجوع", comment: ""), style: .plain , target: self, action: #selector(handleCancel))

    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    
        view.backgroundColor = .white
        let player = AVPlayer(url: URL(fileURLWithPath: Bundle.main.path(forResource: "نصائح طبية", ofType: "mp4")!))
//        let vc = AVPlayerViewController()
//        let layer = AVPlayerLayer(player: player)
//        let avPlayerController = AVPlayerViewController()
//        //layer.frame = view.bounds
//        layer.frame = CGRect(x: 20 , y: 300, width: 343, height: 264)
//        layer.videoGravity = .resizeAspectFill
//        vc.showsPlaybackControls = true
//        view.layer.addSublayer(layer)
//        //AVPlayerLayer.showsPlaybackControls = true
//       // player.volume = 0
//        player.play()
        let playerViewController = AVPlayerViewController()
                playerViewController.player = player
                self.present(playerViewController, animated: true) {
                    playerViewController.player!.play()
                    playerViewController.showsPlaybackControls = true
                }

//        let vc = AVPlayerViewController()
//        vc.showsPlaybackControls = true
//        vc.videoGravity = .resizeAspect
//        //view.addSublayer(vc)
//        vc.view.frame = CGRect(x: 20 , y: 100, width: 100, height: 100)
//       vc.player = player
//        present(vc, animated: true)
//        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: NSLocalizedString("رجوع", comment: ""),
//        style: .plain , target: self, action: #selector(handleCancel))

    }
    @objc func handleCancel() {
        let newVC = ProfileVC()
         //newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
         //dismiss(animated: true, completion: nil)
      }

}


