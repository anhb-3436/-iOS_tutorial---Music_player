//
//  Artist.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 13/03/2024.
//

import Foundation


struct Artist {
    let title: String
    let artistName: String
    let thumbnailURLString: String
    
    init(title: String, artistName: String, thumbnailURLString: String) {
        self.title = title
        self.artistName = artistName
        self.thumbnailURLString = thumbnailURLString
    }
}

extension Artist {
    init?(json: [String: Any]) {
        guard let data = json["data"] as? [String: Any],
              let title = data["title"] as? String,
              let artists = data["artists"] as? [[String: Any]],
              let firstArtist = artists.first,
              let artistName = firstArtist["name"] as? String,
              let thumbnailString = firstArtist["thumbnail"] as? String,
              let thumbnailURL = URL(string: thumbnailString) else {
            return nil
        }
        self.title = title
        self.artistName = artistName
        self.thumbnailURLString = thumbnailURL.absoluteString
    }
}


