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
        //tat gach ngang
        tableView.separatorStyle = .none

        
        // 3 buoc quan trong moi su dung duoc tableview
        tableView.register(UINib(nibName: "SongTableViewCell", bundle: nil), forCellReuseIdentifier: "SongTableViewCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

}

extension HomePageViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // lay so luong Song trong Lists
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SongTableViewCell") as? SongTableViewCell
        //Neu null thi tra ve Cell rong
        else { return UITableViewCell() }
        cell.configCell(song: Song.getPlayList()[indexPath.row])
        return cell
    }
    
    
}

extension HomePageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedSong = songs[indexPath.row]
        //print (selectedSong)
        
        // Khởi tạo DetailViewController từ storyboard
        if let detailViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            print (selectedSong)
            
            // Truyền dữ liệu của bài hát được chọn vào DetailViewController
            detailViewController.selectedSong = selectedSong
            
            present(detailViewController, animated: true, completion: nil)
        }
    }
}
