//
//  Song.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 07/03/2024.
//

import Foundation

struct Song {
    let name: String
    let fileName: String
    let performer: String
    let thumpNail: String
    
    static func getPlayList() -> [Song] {
        var songs: [Song] = []
        songs.append (Song(name: "Hư Không", fileName: "musicHuKhong", performer: "Kha", thumpNail: "musicHuKhong"))
        songs.append (Song(name: "Wrong time", fileName: "musicWrong", performer: "Puppy", thumpNail: "musicWrong"))
        songs.append (Song(name: "Chuyện của chúng ta", fileName: "musicChuyen", performer: "Kha", thumpNail: "musicChuyen"))
        songs.append (Song(name: "Những lời hứa bỏ quên", fileName: "musicNhung", performer: "Vũ", thumpNail: "musicNhung"))
        return songs
    }
}
