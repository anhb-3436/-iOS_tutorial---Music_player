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
    
    var selectedSong: Song?

    override func viewDidLoad() {
        super.viewDidLoad()
        showDetailSong()
    }
    
    func showDetailSong () {
        // Hiển thị thông tin của bài hát được chọn
        if let song = selectedSong {
            detailImageView.image = UIImage(named: song.thumpNail)
            titleDetailLabel.text = song.name
            performerDetailLabel.text = song.performer
        }
    }


}

