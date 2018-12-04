//
//  InfoViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 22/11/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    
    @IBOutlet weak var labelSubtitle: UILabel!
    var station: RadioStation!
    
    @IBOutlet weak var labelDesc: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupStationText()
    }
    
    func setupStationText() {
        labelText.text = station.name
        labelSubtitle.text = station.desc
        labelDesc.text = station.longDesc
    }

    @IBAction func backHome(_ sender: Any) {
        
        _ = navigationController?.popViewController(animated: true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
