//
//  Models.swift
//  Podcast
//
//  Created by Ivan Quintana on 12/03/20.
//  Copyright © 2020 Ivan Quintana. All rights reserved.
//

import Foundation

struct ItunesResult: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl600: String
}
