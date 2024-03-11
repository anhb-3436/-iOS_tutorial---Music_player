//
//  SongTableViewCell.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 07/03/2024.
//

import UIKit

class SongTableViewCell: UITableViewCell {

    
    @IBOutlet weak var thumpNailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var performerLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        selectionStyle = .none
    }
    
    // truyen vao cell model
    func configCell (song: Song) {
        thumpNailImageView.image = UIImage(named: song.thumpNail)
        titleLabel.text = song.name
        performerLabel.text = song.performer
    }
    
}
