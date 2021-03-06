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
    
    var podcasts: [Result]   = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationItems()
        setupTableView()
        getPodcasts(for: "News")
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
    
    func getPodcasts(for str: String) {
        let formatedString = str.replacingOccurrences(of: " ", with: "%20")
        guard let url: URL = URL(string: "https://itunes.apple.com/search?term=\(formatedString)&media=podcast") else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error: ", error.localizedDescription)
                return
            }
            
            if let data = data {
                let itunesResult = try? JSONDecoder().decode(ItunesResult.self, from: data)
                print("resultados: ", itunesResult?.resultCount ?? "Reading Error")
                self?.podcasts = itunesResult?.results ?? []
                
            }
        }
        task.resume()
            
    }
}

extension PodcastTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return podcasts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard indexPath.row < podcasts.count  else {
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PodcastCell
        cell.podcastInfo = podcasts[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = EpisodesTableViewController()
        controller.podcast = podcasts[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}


extension PodcastTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        getPodcasts(for: searchText)
    }
}
