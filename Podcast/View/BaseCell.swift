//
//  BaseCell.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

class BaseCell: UITableViewCell {
    
    let leftImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        im.backgroundColor = .red
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    func setupViews() {
        addSubview(leftImageView)
        leftImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        leftImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        leftImageView.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        leftImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.7).isActive = true
        
        addSubview(label1)
        label1.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 10).isActive = true
        label1.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        label1.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant:  -10).isActive = true
        label1.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        label1.text = "Test"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
