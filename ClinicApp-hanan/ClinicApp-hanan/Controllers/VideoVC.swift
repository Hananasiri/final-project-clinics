//
//  VideoVC.swift
//  ClinicApp-hanan
//
//  Created by  HANAN ASIRI on 08/06/1443 AH.
//
//
import UIKit
import AVFoundation
import AVKit


 class VideoVC: UIViewController {
     
     
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //view.backgroundColor = .black
        
        let player = AVPlayer(url: URL(fileURLWithPath:
        Bundle.main.path(forResource: "نصائح طبية", ofType: "mp4")!))
        // use AVKit
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated: true) {
        playerViewController.player!.play()
        playerViewController.showsPlaybackControls = true
   
    }
    }
//    @objc func handleCancel() {
//        let newVC = ProfileVC()
//         newVC.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(newVC,animated: true)
//         dismiss(animated: true, completion: nil)

  }



