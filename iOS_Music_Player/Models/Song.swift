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
        songs.append (Song(name: "Hư Không", fileName: "hukhongSong", performer: "Kha", thumpNail: "musicHuKhong"))
        songs.append (Song(name: "Wrong time", fileName: "wrongSong", performer: "Puppy", thumpNail: "musicWrong"))
        songs.append (Song(name: "Chuyện của chúng ta", fileName: "chuyenSong", performer: "Erik", thumpNail: "musicChuyen"))
        songs.append (Song(name: "Những lời hứa bỏ quên", fileName: "nhungSong", performer: "Vũ", thumpNail: "musicNhung"))
        songs.append (Song(name: "Nghe em", fileName: "ngheSong", performer: "Thinh Suy", thumpNail: "musicNgheem"))
        songs.append (Song(name: "Bước qua nhau", fileName: "buocSong", performer: "Vũ", thumpNail: "musicBuoc"))
        songs.append (Song(name: "Chìm sâu", fileName: "chimSong", performer: "MCK", thumpNail: "musicWrong"))
        songs.append (Song(name: "Đại lộ mặt trời", fileName: "daiSong", performer: "chillies", thumpNail: "musicDai"))
        songs.append (Song(name: "Nơi này có anh", fileName: "noiSong", performer: "MTP", thumpNail: "musicNoi"))
        songs.append (Song(name: "Cứ chill thôi", fileName: "cuSong", performer: "Chillies", thumpNail: "musicCu"))
        return songs
    }
}
