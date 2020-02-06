//
//  ViewController.swift
//  project6
//
//  Created by Li on 2/6/20.
//  Copyright © 2020 Li. All rights reserved.
//
 import UIKit

 class ViewController: UIViewController {

    var previous: UILabel?
     override func viewDidLoad() {
        super.viewDidLoad()
        let label1 = addLabel(text: "Some", backgroundColor: .blue)
        let label2 = addLabel(text: "text", backgroundColor: .brown)
        let label3 = addLabel(text: "in", backgroundColor: .cyan)
        let label4 = addLabel(text: "label", backgroundColor: .green)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(label3)
        view.addSubview(label4)
        
        for label in [label1, label2, label3, label4] {
            label.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            if let previous = previous {
                label.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            previous = label
        }
    }

     func addLabel(text: String, backgroundColor: UIColor) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.backgroundColor = backgroundColor
        label.sizeToFit()
        return label
    }

 }
