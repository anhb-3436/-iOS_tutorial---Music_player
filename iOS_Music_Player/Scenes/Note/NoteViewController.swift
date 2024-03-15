//
//  NoteViewController.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 11/03/2024.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {
    
    
    @IBOutlet weak var nameSingerFill: UITextField!
    @IBOutlet weak var nameSongFill: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    private let coreDataManager = CoreDataManager.shared
    var songs: [SongCoreData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
    }
    
    private func configTableView() {
        songs = coreDataManager.fetchData()
        
        tableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteTableViewCell")
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        guard let nameSinger = nameSingerFill.text, !nameSinger.isEmpty,
              let nameSong = nameSongFill.text, !nameSong.isEmpty else {
            return
        }
        
        // Save data to Core Data
        coreDataManager.addData(nameSinger: nameSinger, nameSong: nameSong)
        
        // Fetch data again after saving
        songs = coreDataManager.fetchData()
        
        // Reload table view to reflect changes
        tableView.reloadData()
        
        // Clear text fields after adding
        nameSingerFill.text = ""
        nameSongFill.text = ""
    }
}

extension NoteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteTableViewCell") as? NoteTableViewCell
                //if null ==> return cell null
        else { return UITableViewCell() }
        cell.configCell(song: songs[indexPath.row], delegate: self)
        return cell
    }
}

extension NoteViewController: NoteTableViewCellDelegate {
    func deleteSong(_ song: SongCoreData) {
        coreDataManager.deleteData(song)
        
        // Fetch data again after deletion
        songs = coreDataManager.fetchData()
        
        tableView.reloadData()
    }
}
