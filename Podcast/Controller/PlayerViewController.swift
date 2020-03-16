//
//  PlayerViewController.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit
import AVKit

//class PlayerViewController: UIViewController {
//
//    let mainImageView: UIImageView = {
//        let im = UIImageView()
//        im.contentMode = .scaleAspectFill
//        im.backgroundColor = .green
//        im.layer.cornerRadius = 15
//        im.translatesAutoresizingMaskIntoConstraints = false
//        return im
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupNavigationItems()
//        setupViews()
//    }
//
//    func setupNavigationItems() {
//        navigationItem.title = "Player"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeButtonTapped))
//    }
//
//    func setupViews() {
//        view.addSubview(mainImageView)
//        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
//        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
//        mainImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
//    }
//
//    @objc func closeButtonTapped() {
//        self.dismiss(animated: true, completion: nil)
//    }
//}

enum StatusType {
    case none, play
}

class PlayerViewController: UIViewController {
    var episode: Episode! {
        didSet {
            guard let url = URL(string: episode.imageURL) else {return}
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imageView1.image = image
                    }
                }
            }.resume()
        }
    }
    
    var imageView1: UIImageView = {
        let im = UIImageView()
        im.backgroundColor = .gray
        im.contentMode = .scaleAspectFill
        im.layer.cornerRadius = 15
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    let playButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "play")?.withRenderingMode(.alwaysOriginal), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    let player: AVPlayer = {
        let av = AVPlayer()
        av.automaticallyWaitsToMinimizeStalling = false
        return av
    }()
    
    var status: StatusType = .none
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationItem.title = "Podcast"
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(imageView1)
        imageView1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70).isActive = true
        imageView1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView1.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        imageView1.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        view.addSubview(playButton)
        playButton.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 70).isActive = true
        playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        playButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        playButton.addTarget(self, action: #selector(playButtonPlayer), for: .touchUpInside)
        
    }

    
    @objc func playButtonPlayer() {
        if status == .none {
            guard let url = URL(string: episode.url) else {return}
            let playerItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playerItem)
            player.play()
            status = .play
            playButton.setImage(UIImage(named: "pause")?.withRenderingMode(.alwaysOriginal), for: .normal)
        } else {
            if player.timeControlStatus == .playing {
                player.pause()
                playButton.setImage(UIImage(named: "play")?.withRenderingMode(.alwaysOriginal), for: .normal)
            } else {
                player.play()
                playButton.setImage(UIImage(named: "pause")?.withRenderingMode(.alwaysOriginal), for: .normal)
            }
        }
        
    }
}
