//
//  SportViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 28/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class SportViewController: UIViewController {

    @IBOutlet weak var button_menu: UIBarButtonItem!

    /// charge les données en mémoire.
    override func viewDidLoad() {
        super.viewDidLoad()

        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }


}
