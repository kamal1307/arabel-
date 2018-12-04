//
//  ViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 27/09/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
class ViewController: UIViewController {

    var playerItem : AVPlayerItem?
    var player: AVPlayer?
    var station : RadioStation!
 
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var button_menu: UIBarButtonItem!
    @IBOutlet weak var btnPlay: UIButton!
   
    // play et pause ok
    @IBAction func btnn(_ sender: Any) {
        if player?.rate == 0
        {
            player!.play()
            btnPlay.setImage(UIImage(named: "pause.png"), for: UIControl.State.normal)
        } else {
            player!.pause()
            
             btnPlay.setImage(UIImage(named: "play-button.png"), for: UIControl.State.normal)
        }
        
    }
    
    // stop ok
    @IBAction func button_stop(_ sender: Any) {
        player?.replaceCurrentItem(with: nil) // stop AVPlayer avant lancer un nouveau player
        btnPlay.setImage(UIImage(named: "play-button.png"), for: UIControl.State.normal)
        let url = NSURL(string: station.streamURL)
        playerItem = AVPlayerItem(url: url! as URL)
        player = AVPlayer(playerItem: playerItem!)
    }
    // redérige vers facebook
    @IBAction func btnFacebook(_ sender: Any) {
        
        guard let url = URL(string: "https://www.facebook.com/AraBel.fm/") else { return }
        UIApplication.shared.open(url)
    }
    //redérige vers instagram
    @IBAction func btnInstagram(_ sender: Any) {
        
        guard let url = URL(string: "https://www.instagram.com/arabelfm/") else { return }
        UIApplication.shared.open(url)
    }
    //redérige vers youtube
    @IBAction func btnYoutube(_ sender: Any) {
        
        guard let url = URL(string: "https://www.youtube.com/user/AraBelFM") else { return }
        UIApplication.shared.open(url)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Info", let infoController = segue.destination as? InfoViewController else { return }
        infoController.station = station
      
    }
    
    @IBAction func btnInfo(_ sender: Any) {
        
        performSegue(withIdentifier: "Info", sender: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        loadDataFromJSON()
        setupText()
       /* let url = NSURL(string: station.streamURL)
        playerItem = AVPlayerItem(url: url! as URL)
        player = AVPlayer(playerItem: playerItem!)
        player!.play()*/
        initialPlayerAndPlay()
    }
    
    func initialPlayerAndPlay() {
        let url = NSURL(string: station.streamURL)
        playerItem = AVPlayerItem(url: url! as URL)
        player = AVPlayer(playerItem: playerItem!)
        player!.play()
         btnPlay.setImage(UIImage(named: "pause.png"), for: UIControl.State.normal)
    }
    
    func viewWillAppear(animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: Selector(("finishedPlaying:")), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    
    func viewWillDisappear(animated: Bool) {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupText() {
        labelSubtitle.text = station.desc
    }
    
    func loadDataFromJSON() {
        var name: String!
        var stream: String!
        var desc: String!
        var longDesc: String!
        if let path = Bundle.main.url(forResource: "stations", withExtension: "json") {
            
            do {
                let jsonData = try Data(contentsOf: path, options: .mappedIfSafe)
                do {
                    if let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions(rawValue: 0)) as? NSDictionary {
                        if let personArray = jsonResult.value(forKey: "station") as? NSArray {
                            for (_, element) in personArray.enumerated() {
                                if let element = element as? NSDictionary {
                                    name = element.value(forKey: "name") as? String
                                    stream = element.value(forKey: "streamURL") as? String
                                    desc = element.value(forKey: "desc") as? String
                                    longDesc = element.value(forKey: "longDesc") as? String
                                    //teste impression
                                    print("Name: \(name),  url: \(stream), desc: \(desc)", "longDesc: \(longDesc)")
                                }
                            }
                        }
                    }
                    station = RadioStation(name,stream,desc,longDesc)
                    print("coco: \(station.name)")
                } catch let error as NSError {
                    print("Error: \(error)")
                }
            } catch let error as NSError {
                print("Error: \(error)")
            }
        }
        
    }
    
    func finishedPlaying(myNotification:NSNotification) {
        btnPlay.setImage(UIImage(named: "play-button.png"), for: UIControl.State.normal)
        
        let stopedPlayerItem: AVPlayerItem = myNotification.object as! AVPlayerItem
        stopedPlayerItem.seek(to: CMTime.zero)
    }
    
    

}

