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
    var amountOfAnswers = 0
    
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
    
    func threeCountries(action: UIAlertAction! = nil) {
        if amountOfAnswers == 10 {
            let finalAlert = UIAlertController(title: "Congratulations!", message: "Your final score is \(score) out of 10", preferredStyle: .alert)
            finalAlert.addAction(UIAlertAction(title: "Restart", style: .default))
            //finalAlert.addAction(UIAlertAction(title: "Exit", style: .destructive))
            present(finalAlert, animated: true)
            score = 0
            amountOfAnswers = 0
        }
        
        title = "Score: \(score)"
        
        countries.shuffle()
        correctAncwer = Int.random(in: 0...2)
        
        uiScore.text = countries[correctAncwer].uppercased()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        var alertTitle: String
        if correctAncwer == sender.tag {
            alertTitle = "Correct!"
            score += 1
        } else {
            alertTitle = "Wrong!"
            score -= 1
        }
        amountOfAnswers += 1
        let ac = UIAlertController(title: alertTitle, message: "Your score is \(score)", preferredStyle: .alert)
        
        if alertTitle == "Wrong!" {
            ac.message = "It was flag of \(countries[sender.tag].uppercased())"
        }
        
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: threeCountries))
        present(ac, animated: true)
    }
}

