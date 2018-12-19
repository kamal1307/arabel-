//
//  ViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 27/09/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

    var playerItem : AVPlayerItem?
    var player: AVPlayer?
    var station : RadioStation!
 
    @IBOutlet weak var labelSubtitle: UILabel!
    @IBOutlet weak var button_menu: UIBarButtonItem!
    @IBOutlet weak var btnPlay: UIButton!
   
    /**
        Cette méthode permet de controler le flux audio, donc l'arrêt et la reprise.
     
        - Parameter sender: l'action du bouton
    */
    @IBAction func btnn(_ sender: UIButton) {
        if player?.rate == 0
        {
            sender.pulsastion()
            player!.play()
            btnPlay.setImage(UIImage(named: "pause.png"), for: UIControl.State.normal)
        } else {
            player!.pause()
            sender.pulsastion()
             btnPlay.setImage(UIImage(named: "play-button.png"), for: UIControl.State.normal)
        }
        
    }
    
    
    
    /**
     Cette méthode permet d'arrêter complétement le flux audio.
     
     - Parameter sender: l'action du bouton
     */
    @IBAction func button_stop(_ sender: UIButton) {
        sender.pulsastion()
        player?.replaceCurrentItem(with: nil) // stop AVPlayer avant lancer un nouveau player
        btnPlay.setImage(UIImage(named: "play-button.png"), for: UIControl.State.normal)
        let url = NSURL(string: station.streamURL)
        playerItem = AVPlayerItem(url: url! as URL)
        player = AVPlayer(playerItem: playerItem!)
    }
   
    /**
     Cette méthode redirige l'utilisateur vers le réseau social facebook.
     
     - Parameter sender: l'action du bouton
     */
    @IBAction func btnFacebook(_ sender: Any) {
        
        guard let url = URL(string: "https://www.facebook.com/AraBel.fm/") else { return }
        UIApplication.shared.open(url)
    }
    
    /**
     Cette méthode redirige l'utilisateur vers le réseau social instagram.
     
     - Parameter sender: l'action du bouton
     */
    
    @IBAction func btnInstagram(_ sender: Any) {
        
        guard let url = URL(string: "https://www.instagram.com/arabelfm/") else { return }
        UIApplication.shared.open(url)
    }
    
    /**
     Cette méthode redirige l'utilisateur vers youtube.
     
     - Parameter sender: l'action du bouton
     */
    @IBAction func btnYoutube(_ sender: Any) {
        
        guard let url = URL(string: "https://www.youtube.com/user/AraBelFM") else { return }
        UIApplication.shared.open(url)
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Info", let infoController = segue.destination as? InfoViewController else { return }
        infoController.station = station
      
    }

    /**
     Cette méthode redirige vers l'interface InfoViewController.
     
     - Parameter sender: l'action du bouton
     */
    @IBAction func btnInfo(_ sender: Any) {
        
        performSegue(withIdentifier: "Info", sender: self)
    }
    
    /// Appelé après que la vue du contrôleur soit chargée en mémoire.
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        loadDataFromJSON()
        setupText()
        initialPlayerAndPlay()
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
      
    }
    /// Cette méthode initialise le flux audio.
    func initialPlayerAndPlay() {
        
        let url = NSURL(string: station.streamURL)
        playerItem = AVPlayerItem(url: url! as URL)
        player = AVPlayer(playerItem: playerItem!)
        player!.play()
         btnPlay.setImage(UIImage(named: "pause.png"), for: UIControl.State.normal)
    }
    
    /**
     Notifie le contrôleur de vue que sa vue est sur le point d'être ajoutée à une hiérarchie de vues.
     
     - Parameter animated: toutes les animations sont configurées pour montrer la vue. Si c'est vrai, la vue est ajoutée à la fenêtre à l'aide d'une animation
     */
    func viewWillAppear(animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: Selector(("finishedPlaying:")), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
        
    }

    /**
     Notifie le contrôleur de vue que sa vue est sur le point d'être supprimée d'une hiérarchie de vues.
     
     - Parameter animated: toutes les animations sont configurées pour montrer la vue. Si vrai, la disparition de la vue est en cours d'animation
     */
    func viewWillDisappear(animated: Bool) {
        
        NotificationCenter.default.removeObserver(self)
    }
    
    /// afficher le slogo d'arabel
    func setupText() {
        labelSubtitle.text = station.desc
    }
    
    /// Permer de charger les données du fichier Json
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
    
    /**
     Cette méthode  permet de changer l'animation du bouton. Elle est enregistrer comme observeur par la fonction viewWillAppear
     
     - Parameter myNotifiction: Un objet contenant des informations diffusées à des observateurs enregistrés qui se connectent à Notification. On utilise NSNotification lorsqu'on a  besoin d'une sémantique de référence ou d'un autre comportement spécifique à la fondation.
     */
    func finishedPlaying(myNotification:NSNotification) {
        btnPlay.setImage(UIImage(named: "play-button.png"), for: UIControl.State.normal)
        
        let stopedPlayerItem: AVPlayerItem = myNotification.object as! AVPlayerItem
        stopedPlayerItem.seek(to: CMTime.zero)
    }
    
    

}

