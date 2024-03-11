//
//  ViewController.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 07/03/2024.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailImageView: UIImageView!
    
    @IBOutlet weak var titleDetailLabel: UILabel!
    
    @IBOutlet weak var performerDetailLabel: UILabel!
    
    private var songs = [Song]()
    private var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        configDetailSong()
    }
    
    private func configDetailSong () {
        let currentSong = songs[currentIndex]
        detailImageView.image = UIImage(named: currentSong.thumpNail)
        titleDetailLabel.text = currentSong.name
        performerDetailLabel.text = currentSong.performer
    }
    
    func configSongs (songs: [Song], index: Int) {
        self.songs = songs
        self.currentIndex = index
    }


}

