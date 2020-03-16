//
//  EpisodeCell.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

class EpisodeCell: BaseCell {
    
    var episode: Episode! {
        didSet {
            titleLabel.text = episode.title
            subTitleLabel.text = getDurationFormat(for: episode.duration)
            getAndSetImage(from: episode.imageURL)
        }
    }
    
    override func setupViews() {
        super.setupViews()
    }
    
    func getDurationFormat(for duration: Double) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional

        let formattedString = formatter.string(from: TimeInterval(duration))!
        return String(formattedString)
    }
    

}
