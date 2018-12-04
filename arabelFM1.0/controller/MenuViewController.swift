//
//  MenuViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 27/09/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import MessageUI

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MFMessageComposeViewControllerDelegate{

    var menuArray:Array = [String]()
    var iconImg:Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuArray = ["Radio","Live","Programmation","Podcast","Contact"]
        iconImg = [UIImage(named: "Radio")!,UIImage(named: "Live")!,UIImage(named: "Horaire")!,UIImage(named: "Podcast")!,UIImage(named: "Contact")!]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell") as! MenuTableViewCell
        cell.imageIcon.image = iconImg[indexPath.row]
        cell.label_Menu.text! = menuArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 60
        } else if indexPath.row == 1 {
            return 60
        } else {
            return 60
        }
    }
    

    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
  
        if section == 0 {
            
          // let imageView: UIImageView = UIImageView()
             let imageView = UIImageView(frame: CGRect(x: 0, y: 20, width: 264, height: 128))
            imageView.clipsToBounds = true
            imageView.contentMode = .scaleAspectFill
            imageView.image =  UIImage(named: "arabelFHD")!
            return imageView
        }
        
        return nil
    
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //tester encore sur iphone
    @IBAction func smsShow(_ sender: Any) {
        let number = "sms:+12345678901"
        UIApplication.shared.openURL(NSURL(string: number)! as URL)
    }
    
    @IBAction func sendMsg(_ sender: Any) {
        
        if MFMessageComposeViewController.canSendText() {
            let controller = MFMessageComposeViewController()
            controller.body = "Message à Arabel : "
            controller.recipients = ["0488106800"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        } else {
            print("Teste on iphone")
        }
    }
    
   
   // self.button_ar.setImage(UIImage(named: "play-button.png"), for: UIControl.State.normal)
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let revealviewcontroller:SWRevealViewController = self.revealViewController()
        self.performSegue(withIdentifier: menuArray[indexPath.row], sender: self)
       // let cell:MenuTableViewCell = tableView.cellForRow(at: indexPath) as! MenuTableViewCell
       // print(cell.label_Menu.text!)
      /*  if cell.label_Menu.text! == "Contact"
        {
            print("contact")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
                newViewcontroller.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255.0, green: 0/255.0, blue: 3/255.0, alpha: 100.0/100.0)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            
        }*/
      /*  if cell.label_Menu.text! == "Radio"
        {
            print("radio")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            newViewcontroller.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255.0, green: 0/255.0, blue: 3/255.0, alpha: 100.0/100.0)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            
        }*/
       /* if cell.label_Menu.text! == "Programmation"
        {
            print("radio")
            let mainstoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newViewcontroller = mainstoryboard.instantiateViewController(withIdentifier: "ProgrammationViewController") as! ProgrammationViewController
            let newFrontController = UINavigationController.init(rootViewController: newViewcontroller)
            newViewcontroller.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255.0, green: 0/255.0, blue: 3/255.0, alpha: 100.0/100.0)
            revealviewcontroller.pushFrontViewController(newFrontController, animated: true)
            
        }*/
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
