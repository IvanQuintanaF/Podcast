//
//  EpisodesTableViewController.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation
import UIKit
import FeedKit

class EpisodesTableViewController: UITableViewController {
    
    let cellID = "cellID"
    
    var podcast: Result! {
        didSet {
            title = podcast.trackName
            getEpisodes()
        }
    }
    
    var episodes: [Episode] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationItems()
        setupTableView()
    }
    
    func setupNavigationItems() {
//        navigationItem.title = "Episodes"
    }
    
    func setupTableView()  {
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: cellID)
    }
    
    func getEpisodes() {
        guard let urlFeed = URL(string: podcast.feedUrl) else {
            print("invalido")
            return
        }
        
        let parser = FeedParser(URL: urlFeed)
        parser.parseAsync { [weak self]  (result)  in
            switch result {
            case .success(let feed):
                let imageURL: String = feed.rssFeed?.image?.url ?? ""
                for item in feed.rssFeed?.items ?? [] {
                    
                    let title: String = item.title ?? ""
                    let duration = item.iTunes?.iTunesDuration ?? 0
                    let url = item.enclosure?.attributes?.url ?? ""
                    
                    let episode = Episode(imageURL: imageURL, title: title, duration: duration, url: url)
                    self?.episodes.append(episode)
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                
                break
                
            case .failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }    
}

extension EpisodesTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! EpisodeCell
        cell.episode = episodes[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = PlayerViewController()
        let navController = UINavigationController(rootViewController: controller)
        present(navController, animated: true, completion: nil)
    }
}
