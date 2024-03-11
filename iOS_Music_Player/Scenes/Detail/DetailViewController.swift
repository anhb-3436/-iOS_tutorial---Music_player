//
//  ViewController.swift
//  iOS_Music_Player
//
//  Created by ho.bao.an on 07/03/2024.
//

import UIKit
import AVFoundation
import MediaPlayer

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var performerDetailLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var slider: UISlider!
    
    private var player: AVAudioPlayer?
    private var songs = [Song]()
    private var currentIndex = 0
    private var isPlaying = true
    private var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDetailSong()
    }
    
    private func configDetailSong () {
        guard let url = Bundle.main.url(forResource: songs[currentIndex].fileName, withExtension: "mp3") else {
            print("Music file does not exist")
            return
        }
        
        do {
            let session = AVAudioSession.sharedInstance()
            try session.setMode(.default)
            try session.setActive(true, options: .notifyOthersOnDeactivation)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch {
            print("ERROR: \(error)")
        }
        
        // update UI
        let currentSong = songs[currentIndex]
        detailImageView.image = UIImage(named: currentSong.thumpNail)
        titleDetailLabel.text = currentSong.name
        performerDetailLabel.text = currentSong.performer
        
        // update status slider
        setUpSlider(player: player)
    }
    
    func configSongs (songs: [Song], index: Int) {
        self.songs = songs
        self.currentIndex = index
    }
    
    override func remoteControlReceived(with event: UIEvent?) {
        guard let type = event?.subtype else {return}
        switch type {
        case .remoteControlPlay:
            player?.play()
        case .remoteControlPause:
            player?.pause()
        case .remoteControlStop:
            player?.stop()
        case .remoteControlNextTrack:
            if (currentIndex < songs.count - 1) {
                currentIndex += 1
            } else {
                currentIndex = 0
            }
        case .remoteControlPreviousTrack:
            if (currentIndex > 0) {
                currentIndex -= 1
            } else {
                currentIndex = songs.count - 1
            }
            
        default:
            break
        }
    }
    
    private func statusPlayPauseButton(button: UIButton) {
        guard let player = player else {
            return
        }
        let isPlaying = player.isPlaying
        let buttonImageName = isPlaying ? "pauseButton" : "playButton"
        let buttonImage = UIImage(named: buttonImageName)
        button.setImage(buttonImage, for: .normal)
    }
    
    private func setUpSlider(player: AVAudioPlayer?) {
        slider.maximumValue = Float(player?.duration ?? 0)
        slider.addTarget(self, action: #selector(didSlideSlider(_:)), for: .valueChanged)
        Timer.scheduledTimer(timeInterval: 0.0, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    @objc private func didSlideSlider(_ slider: UISlider) {
        player?.currentTime = TimeInterval(slider.value)
        player?.prepareToPlay()
        isPlaying = true
        statusPlayPauseButton(button: playButton)
    }
    
    @objc private func updateSlider() {
        slider.value = Float(player?.currentTime ?? 0)
    }
    
    @IBAction func playPauseButtonTaped(_ sender: Any) {
        if let player = player {
            if isPlaying {
                player.pause()
            } else {
                player.play()
            }
        }
        isPlaying = !isPlaying
        statusPlayPauseButton(button: playButton)
    }
    
    @IBAction func nextButtonTaped(_ sender: Any) {
        if (currentIndex < songs.count - 1) {
            currentIndex += 1
        } else {
            currentIndex = 0
        }
        isPlaying = true
        statusPlayPauseButton(button: playButton)
        configDetailSong()
    }
    
    @IBAction func previousButtonTaped(_ sender: Any) {
        if (currentIndex > 0) {
            currentIndex -= 1
        } else {
            currentIndex = songs.count - 1
        }
        isPlaying = true
        statusPlayPauseButton(button: playButton)
        configDetailSong()
    }
}

