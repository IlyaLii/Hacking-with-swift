//
//  ViewController.swift
//  Project1
//
//  Created by Li on 1/31/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var images = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                images.append(item)
            }
        }
    }


}

