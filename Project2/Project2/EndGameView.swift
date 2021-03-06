//
//  EndGameView.swift
//  Project2
//
//  Created by Li on 2/8/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class EndGameView: UIView {

    var highScoreLabel: UILabel!
    var scoreLabel: UILabel!
    var newGameButton: UIButton!
    
    init(score: Int) {
        super.init(frame: CGRect(x: 0, y: 0, width: 256, height: 216))
        self.layer.cornerRadius = 25.6
        self.layer.borderWidth = 4
        let myDynamicColor = UIColor { (traitCollection: UITraitCollection) -> UIColor in
            if traitCollection.userInterfaceStyle == .dark {
                return UIColor(red: 0, green: 0, blue: 0, alpha: 1.0)
            } else {
                return UIColor(red: 220, green: 220, blue: 220, alpha: 1)
            }
        }
        self.backgroundColor = myDynamicColor
        let defaults = UserDefaults.standard
        var highScore = defaults.integer(forKey: "highScore")
        
        if highScore < score {
            highScore = score
            defaults.set(highScore, forKey: "highScore")
        }
        
        
        
        highScoreLabel = UILabel()
        highScoreLabel.text = "Highscore: \(highScore)"
        highScoreLabel.textColor = .black
        highScoreLabel.textAlignment = .center
        highScoreLabel.font = UIFont.systemFont(ofSize: 24)
        highScoreLabel.sizeToFit()
        highScoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(highScoreLabel)
        
        var text: String?
        if score == 10 {
            text = "parxom krut"
        } else {
            text = "parxom lox"
        }
        scoreLabel = UILabel()
        scoreLabel.text = """
        \(text!)
        Score: \(score)
        """
        scoreLabel.numberOfLines = 0
        scoreLabel.textColor = .black
        scoreLabel.textAlignment = .center
        scoreLabel.font = UIFont.systemFont(ofSize: 24)
        scoreLabel.sizeToFit()
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(scoreLabel)
        
        newGameButton = UIButton()
        newGameButton.layer.borderWidth = 1
        newGameButton.layer.borderColor = UIColor.black.cgColor
        newGameButton.layer.cornerRadius = 20
        newGameButton.setTitle("New game", for: .normal)
        newGameButton.setTitleColor(.black, for: .normal)
        newGameButton.addTarget(self, action: #selector(newGameTapped), for: .touchUpInside)
        newGameButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(newGameButton)
        
        NSLayoutConstraint.activate([
            highScoreLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            highScoreLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            highScoreLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            
            scoreLabel.topAnchor.constraint(equalTo: highScoreLabel.bottomAnchor, constant: 10),
            scoreLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            scoreLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            
            newGameButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            newGameButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 40),
            newGameButton.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -80),
            newGameButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func newGameTapped() {
        self.isHidden = true
    }
}
