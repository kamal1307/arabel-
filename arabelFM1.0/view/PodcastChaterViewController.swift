//
//  PodcastChaterViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 28/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import WebKit

class PodcastChaterViewController: UIViewController {
    
    @IBOutlet weak var button_menu: UIBarButtonItem!
     @IBOutlet weak var podcastPlaylist: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        // Do any additional setup after loading the view.
        loadPage()
    }
    
    func loadPage() {
        
        let url = URL(string: "https://soundcloud.com/arabelfm/sets/fajr-arabel")
        let request = URLRequest(url: url!)
        podcastPlaylist.load(request)
    }
}
