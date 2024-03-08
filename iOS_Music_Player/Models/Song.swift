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
        songs.append (Song(name: "Những lời hứa bỏ quên", fileName: "musicHuKhong", performer: "Vũ", thumpNail: "musicNhung"))
        songs.append (Song(name: "Nghe em", fileName: "musicWrong", performer: "Thinh Suy", thumpNail: "musicNgheem"))
        songs.append (Song(name: "Bước qua nhau", fileName: "musicNhung", performer: "Vũ", thumpNail: "musicBuoc"))
        songs.append (Song(name: "Chìm sâu", fileName: "musicWrong", performer: "MCK", thumpNail: "musicWrong"))
        songs.append (Song(name: "Đại lộ mặt trời", fileName: "musicNhung", performer: "chillies", thumpNail: "musicDai"))
        songs.append (Song(name: "Nơi này có anh", fileName: "musicHuKhong", performer: "MTP", thumpNail: "musicNoi"))
        songs.append (Song(name: "Chứ chill thôi", fileName: "musicChuyen", performer: "Chillies", thumpNail: "musicCu"))
        return songs
    }
}
