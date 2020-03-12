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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupNavigationItems()
    }
    
    func setupNavigationItems() {
        navigationItem.title = "Player"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Close", style: .done, target: self, action: #selector(closeButtonTapped))
    }
    
    @objc func closeButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}
