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
    }

    func askQuestion() {
        countGames += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        let country = countries[correctAnswer].dropLast(4).dropFirst(4)
        title = "\(country.uppercased())"
        scoreLabel.text = "Score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var titleAlert: String?
        var messageAlert: String?
        if sender.tag == correctAnswer {
            score += 1
            self.askQuestion()
        } else {
            score -= 1
            let country = countries[sender.tag].dropLast(4).dropFirst(4)
            titleAlert = "Wrong! That’s the flag of \(country.capitalized)"
            let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true) {
                self.askQuestion()
            }
        }
        
        if countGames == 10 {
            messageAlert = "Your score for 10 games: \(score)"
            score = 0
            countGames = 0
            let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true) {
                self.askQuestion()
            }
        }
        
        
    }
}

