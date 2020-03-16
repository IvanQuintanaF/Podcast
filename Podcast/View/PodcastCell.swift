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
            titleLabel.text = podcastInfo.trackName
            subTitleLabel.text = podcastInfo.artistName
            getAndSetImage(from: podcastInfo.artworkUrl600)
        }
    }
    
    override func setupViews() {
        super.setupViews()
    }
    

}
