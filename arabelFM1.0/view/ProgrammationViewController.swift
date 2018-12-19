//
//  ProgrammationViewController.swift
//  arabelFM1.0
//
//  Created by Admin on 17/10/2018.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class ProgrammationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var button_menu: UIBarButtonItem!
    var titlee:Array = [String]()
    var subtitle:Array = [String]()
    var icnImge:Array = [UIImage]()
    var nameTab: [String] = []
    var timeTab: [String] = []
    var prog:Programmation!
    
    /// charge les données en mémoire.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button_menu.target = revealViewController()
        button_menu.action = #selector(SWRevealViewController.revealToggle(_:))
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())

        // Do any additional setup after loading the view.
        loadDataFromJSON()
        dispayTab() // for testing if is emtpy or not
       // titlee = [prog.title,"La Matinale","Cocktail Chamal","L'Édition de la Rédaction","Le carrefour de l'info","De tout pour faire un monde","Au coeur de la musique","Le Mag Éco","Orient Express","Va y avoir du sport","Le foot autrement","Ach Darlik"]
        
       //  subtitle = ["blablba","Tarik Laabi – Du Lundi au Vendredi de 7h à 9h","Majdoulyne Nabhan – Du Lundi au vendredi de 11h à 12h","Tarik Laabi – Du Lundi au Vendredi de 12h00 à 12h30","Ahmed Cherif – Du Lundi au Vendredi de 16h00 à 17h00","Darrez et Laure Fornier – Du lundi au vendredi de 16h à 18h","Jamal Fadil – Du Lundi au Vendredi de 20h à 22h","Ahmed Cherif / Matthieu Morin – Mardi de 15h à 16h","Majdoulyne Nabhan –  Lundi de 15h00 à 16h00","Jordi Garcia – Jeudi de 19h à 20h","Ahmed Cherif – Lundi de 18h00 à 20h00","Mohamed Chater – Du Lundi au Vendredi de 9h à 11h"]
        
        icnImge = [UIImage(named: "mondher")!,UIImage(named: "equipe")!,UIImage(named: "majdou")!,UIImage(named: "tarik")!,UIImage(named: "ahmed")!,UIImage(named: "darrez")!,UIImage(named: "jamal")!,UIImage(named: "ahmed")!,UIImage(named: "majdousister")!,UIImage(named:"jordi")!,UIImage(named: "ahmed")!,UIImage(named: "chater")!]
    }
    
    /// retourne les différentes variables pour chaque ligne du tableView.

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return nameTab.count
    }
    
    /// retourne les différentes variables pour chaque ligne du tableView.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProgammationCell
            cell.title.text = nameTab[indexPath.row]
            cell.subtitle.text = timeTab[indexPath.row]
            cell.imgProgra.image = icnImge[indexPath.row]
            return cell
    }
    
    /// retourne l'espace désirer entre chaque ligne.
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            return 110
        } else if indexPath.row == 1 {
            return 110
        } else {
            return 110
        }
    }
    
    /// charge les données depuis le fichier Json.
    func loadDataFromJSON() {
        prog = Programmation("", "")
        var title: String!
        var time: String!
        if let pathURL = Bundle.main.url(forResource: "stations", withExtension: "json"){
            
            do {
                
                let jsonData = try Data(contentsOf: pathURL, options: .mappedIfSafe)
                
                let jsonResult = try JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as! [String: Any]
                
                if let persons = jsonResult["programmation"] as? [Any]{
                   // print(persons)
                    for (_, element) in persons.enumerated() {
                        if let element = element as? NSDictionary {
                            
                            title = element.value(forKey: "name") as? String
                            time = element.value(forKey: "time") as? String
                           // print("title: \(title),  time: \(time)")
                            prog.setTitle(title)
                            prog.setTime(time)
                            self.nameTab.append(element.value(forKey: "name") as! String)
                            self.timeTab.append(element.value(forKey: "time") as! String)
                            //print("title: \(prog.getTitle()),  time: \(prog.getTime())")
                        }
                    }
                }
                
            }catch(let error){
                print (error.localizedDescription)
            }
        
    }
  
}
    func dispayTab() {
        for a in nameTab {
            print(a.isEmpty)
        }
    }
}
