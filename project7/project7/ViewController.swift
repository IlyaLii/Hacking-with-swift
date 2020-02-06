//
//  ViewController.swift
//  project7
//
//  Created by Li on 2/6/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var petitions = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Text"
        cell.detailTextLabel?.text = "Detail text label"
        return cell
    }

}

