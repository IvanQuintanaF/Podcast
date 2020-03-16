//
//  PodcastCell.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

class PodcastCell: BaseCell {
    
    var podcastInfo: Result! {
        didSet {
            label1.text = podcastInfo.trackName
            artistNameLabel.text = podcastInfo.artistName
            getAndSetImage()
        }
    }
    
    let artistNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func setupViews() {
        super.setupViews()
        self.addSubview(artistNameLabel)
        artistNameLabel.topAnchor.constraint(equalTo: label1.bottomAnchor).isActive = true
        artistNameLabel.leadingAnchor.constraint(equalTo: label1.leadingAnchor).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: label1.trailingAnchor).isActive = true
    }
    
    func getAndSetImage() {
        let url = URL(string: podcastInfo.artworkUrl600)
        URLSession.shared.dataTask(with: url!) { [weak self] (data, response, error) in
            if let error = error {
                print("error: ", error.localizedDescription)
                return
            }
            if let data = data {
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.leftImageView.image = image
                }
            }
        }.resume()
        
    }
}
