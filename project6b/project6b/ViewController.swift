//
//  ViewController.swift
//  project6b
//
//  Created by Li on 2/6/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let pinkView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let grayView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        pinkView.backgroundColor = .systemPink
        grayView.backgroundColor = .systemGray
        view.addSubview(pinkView)
        view.addSubview(grayView)
        
        pinkView.translatesAutoresizingMaskIntoConstraints = false
        grayView.translatesAutoresizingMaskIntoConstraints = false
        pinkView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        pinkView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        grayView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        grayView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pinkView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        grayView.topAnchor.constraint(equalTo: pinkView.bottomAnchor, constant: 20).isActive = true
        
        
        
    }
    
    
}

