//
//  ViewController.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import UIKit

class PodcastTableViewController: UITableViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationItems()
        setupTableView()
    }
    
    func setupNavigationItems() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Podcast"
        navigationItem.searchController = searchController
        searchController.searchBar.delegate = self
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupTableView()  {
        tableView.register(PodcastCell.self, forCellReuseIdentifier: cellID)
    }
}

extension PodcastTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PodcastCell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = EpisodesTableViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}


extension PodcastTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
