//
//  CoeurViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 28/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class CoeurViewController: UIViewController {

    @IBOutlet weak var button_menu: UIBarButtonItem!
    @IBOutlet weak var podcast: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
        loadPage()
    }

    func loadPage() {
        
        let url = URL(string: "https://soundcloud.com/arabelfm/sets/arabel-au-coeur-de-la-musique")
        let request = URLRequest(url: url!)
        podcast.load(request)
        
    }
}
