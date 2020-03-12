//
//  PlayerViewController.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit

class PlayerViewController: UIViewController {
    
    let mainImageView: UIImageView = {
        let im = UIImageView()
        im.contentMode = .scaleAspectFill
        im.backgroundColor = .green
        im.layer.cornerRadius = 15
        im.translatesAutoresizingMaskIntoConstraints = false
        return im
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationItems()
        setupViews()
    }
    
    func setupNavigationItems() {
        navigationItem.title = "Player"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeButtonTapped))
    }
    
    func setupViews() {
        view.addSubview(mainImageView)
        mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        mainImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
