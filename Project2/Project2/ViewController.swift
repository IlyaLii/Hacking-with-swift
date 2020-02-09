//
//  ViewController.swift
//  Project2
//
//  Created by Li on 1/31/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    var countries = [String]()
    var score = 0 {
        didSet {
            self.title = "Score: \(self.score)"
        }
    }
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(newGame))
    }
    
    @objc func newGame() {
        askQuestion()
        score = 0
        countGames = 0
    }
    func askQuestion() {
        countGames += 1
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        let country = countries[correctAnswer].dropLast(4).dropFirst(4)
        flagLabel.text = "\(country.uppercased())"
        title = "Score: \(score)"
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        })
        
        UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
            sender.transform = CGAffineTransform(scaleX: 1, y: 1)
        })
        var titleAlert: String?
        var messageAlert: String?
        if sender.tag == correctAnswer {
            score += 1
            self.askQuestion()
        } else {
            let country = countries[sender.tag].dropLast(4).dropFirst(4)
            titleAlert = "Wrong! That’s the flag of \(country.capitalized)"
            let alert = UIAlertController(title: titleAlert, message: messageAlert, preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alert.addAction(action)
            present(alert, animated: true) {
                self.askQuestion()
            }
        }
        
        if countGames >= 10 {
            let endGameView = EndGameView(score: score)
            endGameView.center = view.center
            view.addSubview(endGameView)
            self.askQuestion()
            
            score = 0
            countGames = 0
        }
    }
}

