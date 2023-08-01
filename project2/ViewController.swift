//
//  ViewController.swift
//  project2
//
//  Created by Vlad Klunduk on 31/07/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var uiScore: UILabel!
    
    var countries = [String]()
    var score = 0
    var correctAncwer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries = ["estonia", "france", "germany", "ireland", "italy", "monaco",
                     "nigeria","poland", "russia","spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        threeCountries()

    }
    
    func threeCountries() {
        uiScore.text = "Score: \(score)"
        
        countries.shuffle()
        correctAncwer = Int.random(in: 0...2)
        
        title = countries[correctAncwer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func button1Pressed(_ sender: UIButton) {
        if correctAncwer == sender.tag {
            score += 1
        } else {
            score -= 1
        }
        threeCountries()
    }
    @IBAction func buttin2Pressed(_ sender: UIButton) {
        if correctAncwer == sender.tag {
            score += 1
        } else {
            score -= 1
        }
        threeCountries()
    }
    @IBAction func button3Pressed(_ sender: UIButton) {
        if correctAncwer == sender.tag {
            score += 1
        } else {
            score -= 1
        }
        threeCountries()
    }
}

