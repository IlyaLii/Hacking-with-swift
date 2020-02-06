//
//  ViewController.swift
//  Project2
//
//  Created by Li on 1/31/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    var countGames = 0
    
    func fetchImages() {
        let fileManager = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fileManager.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasSuffix(".png") {
                countries.append(item)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImages()
        askQuestion()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
       
    }

    func askQuestion() {
        countGames += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        title = countries[correctAnswer].uppercased()
        scoreLabel.text = "Score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var titleAlert : String
        if sender.tag == correctAnswer {
            score += 1
            titleAlert = "Correct"
        } else {
            score -= 1
            titleAlert = "Wrong! That’s the flag of \(countries[sender.tag])"
        }
        
        var messageAlert = "Your score \(score)"
        if countGames == 10 {
            messageAlert = "Your score for 10 games: \(score)"
            score = 0
            countGames = 0
        }
        
        let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(action)
        present(alert, animated: true) {
            self.askQuestion()
        }
    }
}

