//
//  ViewController.swift
//  project6
//
//  Created by Li on 2/6/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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

