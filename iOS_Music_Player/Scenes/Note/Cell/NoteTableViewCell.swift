//
//  NoteTableViewCell.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 15/03/2024.
//

import UIKit

protocol NoteTableViewCellDelegate: AnyObject {
    func deleteSong(_ song: SongCoreData)
}

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameSinger: UILabel!
    @IBOutlet weak var nameSong: UILabel!
    
    weak var delegate: NoteTableViewCellDelegate?
    var song: SongCoreData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configCell(song: SongCoreData, delegate: NoteTableViewCellDelegate?) {
        self.song = song
        self.delegate = delegate
        nameSinger.text = song.nameSinger
        nameSong.text = song.nameSong
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        guard let song = song else {
            return
        }
        
        // Notify the delegate to handle deletion
        delegate?.deleteSong(song)
    }
    
    
}
