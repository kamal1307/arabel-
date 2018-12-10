//
//  ContactViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 17/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import MapKit
import MessageUI


class ContactViewController: UIViewController,MFMailComposeViewControllerDelegate {
    
   
    

    @IBOutlet weak var button_menu: UIBarButtonItem!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var msgFIeld: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func showMap(_ sender: Any) {
        
        // for destination
        let latitude:CLLocationDegrees = 50.854471
        let longitude:CLLocationDegrees = 4.395203
        
        let regionDistance:CLLocationDistance = 1000
        let coordinates = CLLocationCoordinate2DMake(latitude,longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates,latitudinalMeters: regionDistance,longitudinalMeters: regionDistance)
        
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate:regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        let placeMark = MKPlacemark(coordinate: coordinates)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = "Arabel FM"
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    @IBAction func send(_ sender: Any) {
        print("ok")
        let toRecipient = ["40600@etu.he2b.be"]
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(toRecipient)
        mc.setSubject(nameField.text!)
        mc.setMessageBody("Nom: \(nameField.text!) \n\nPrénom: \(lastNameField.text!) \n\nEmail: \(emailField.text!) \n\nMessage: \(msgFIeld.text!)" , isHTML: false)
        
        self.present(mc, animated: true, completion: nil)
        
    }
    
    @IBAction func dismissKeyboard(_ sender: Any) {
        
        self.resignFirstResponder()
    }
    
    
}



