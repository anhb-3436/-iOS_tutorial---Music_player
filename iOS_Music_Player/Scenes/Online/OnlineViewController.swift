//
//  OnlineViewController.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 11/03/2024.
//

import UIKit

class OnlineViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDataFromAPI()
    }
    
    private func fetchDataFromAPI() {
        let url = URL(string: "https://zingmp3.vn/api/song/get-song-info?id=ZOW0OBU8&ctime=160718421&sig=716b083eea082f38c8eb2ad5aa1023120199bd906a30a6dd533c4987ba473a7eeb0e2b58c5a8d7c69a563bffb4648ad1762fff78298d1c043f0c542d3c92ee68&api_key=38e8643fb0dc04e8d65b99994d3dafff")!
        print ("========== start fetching ==========")
        let task = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                return
            }
            
            if let data = data {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
                    if let json = jsonObject as? [String: Any] {
                        if let artist = Artist(json: json) {
                            print("Title: \(artist.title)")
                            print("Artist Name: \(artist.artistName)")
                            print("Thumbnail URL: \(artist.thumbnailURLString)")
                            
                            DispatchQueue.main.async {
                                self?.updateUI(with: artist)
                            }
                        } else {
                            print("Failed to create Artist object from JSON data.")
                        }
                    } else {
                        print("JSON data is not in expected format.")
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }

    private func updateUI(with artist: Artist) {
        nameLabel.text = artist.artistName
        titleLabel.text = artist.title
        
        if let thumbnailURL = URL(string: artist.thumbnailURLString) {
            DispatchQueue.global().async { [weak self] in
                do {
                    let imageData = try Data(contentsOf: thumbnailURL)
                    DispatchQueue.main.async {
                        self?.imageView.image = UIImage(data: imageData)
                    }
                } catch {
                    print("Error loading image data: \(error)")
                }
            }
        }
    }


}
