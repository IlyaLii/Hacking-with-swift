//
//  ViewController.swift
//  project7
//
//  Created by Li on 2/6/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var petitions = [Petition]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.whitehouse.gov/v1/petitions.json?limit=100"
        guard let url = URL(string: urlString) else {
            showError()
            return }
        guard let data = try? Data(contentsOf: url) else {
            showError()
            return }
        parse(data: data)
    }
    
    func showError() {
        let alert = UIAlertController(title: "Network error", message: "Check your connection and try again", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    func parse(data: Data) {
        let decoder = JSONDecoder()
        guard let json = try? decoder.decode(Petitions.self, from: data)
            else {
            showError()
            return }
        petitions = json.results
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
}

