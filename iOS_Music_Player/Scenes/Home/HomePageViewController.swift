//
//  HomViewController.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 07/03/2024.
//

import UIKit

class HomePageViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var songs: [Song] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        configTableView()
    }
    
    func configTableView() {
        songs = Song.getPlayList()
        tableView.backgroundColor = .black
        tableView.separatorStyle = .none
        
        // 3 important steps in every user using tableview
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // get count in Lists
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell") as? SongTableViewCell
                //if null ==> return cell null
        else { return UITableViewCell() }
        cell.configCell(song: Song.getPlayList()[indexPath.row])
        return cell
    }
}

extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSong = songs[indexPath.row]
        
        // init DetailViewController from storyboard
        guard let detailViewController = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return}
        print (selectedSong)
        
        // Transfers the data of the selected song into DetailViewController
        detailViewController.configSongs(songs: songs, index: indexPath.row)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

