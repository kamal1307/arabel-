//
//  PodcastViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 18/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class PodcastViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    @IBOutlet weak var button_menu: UIBarButtonItem!
    var menuAr:Array = [String]()
    var icnImg:Array = [UIImage]()
    var menuPodcastPlayList:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
        // Do any additional setup after loading the view.
        menuAr = ["Fajr Arabel","La Matinale","Cocktail Chamal","L'Édition de la Rédaction","Le carrefour de l'info","De tout pour faire un monde","Au coeur de la musique","Le Mag Éco","Orient Express","Va y avoir du sport","Le foot autrement","Ach Darlik"]
        icnImg = [UIImage(named: "mondher")!,UIImage(named: "equipe")!,UIImage(named: "majdou")!,UIImage(named: "tarik")!,UIImage(named: "ahmed")!,UIImage(named: "darrez")!,UIImage(named: "jamal")!,UIImage(named: "ahmed")!,UIImage(named: "majdousister")!,UIImage(named:"jordi")!,UIImage(named: "ahmed")!,UIImage(named: "chater")!]
        
        menuPodcastPlayList = ["PodcastChater","Matinal","Cocktail","Redaction","Carrefour","Monde","Coeur","Mag","Orient","Sport","Foot","Darlik"]
        
       
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuAr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! PodcastCell
        cell.imgPodcast.image = icnImg[indexPath.row]
        cell.labelPodcast.text! = menuAr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 110
     
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      
        self.performSegue(withIdentifier: menuPodcastPlayList[indexPath.row], sender: self)
        
    }


}
