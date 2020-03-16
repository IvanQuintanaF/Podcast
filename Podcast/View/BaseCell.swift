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
        im.backgroundColor = .white
        im.image = UIImage(named: "podcastPlaceholder")
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
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
        
        addSubview(titleLabel)
        titleLabel.leadingAnchor.constraint(equalTo: leftImageView.trailingAnchor, constant: 10).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant:  -10).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        titleLabel.text = "Title"
        
        addSubview(subTitleLabel)
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        subTitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subTitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        subTitleLabel.text = "Subtitle"
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getAndSetImage(from url: String) {
        let url = URL(string: url)
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
