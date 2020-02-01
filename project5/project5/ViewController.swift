//
//  ViewController.swift
//  project5
//
//  Created by Li on 2/1/20.
//  Copyright © 2020 Li. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        startGame()
    }

    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll()
        tableView.reloadData()
    }
    
    @objc func addTapped() {
        let alert = UIAlertController(title: "Enter your answer", message: nil, preferredStyle: .alert)
        alert.addTextField(configurationHandler: nil)
        
        let sumbitAction = UIAlertAction(title: "Sumbit", style: .default) { [weak self, weak alert] _ in
            guard let answer = alert?.textFields?.first?.text else { return }
            self?.submit(answer)
        }
        alert.addAction(sumbitAction)
        alert.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(alert, animated: true, completion: nil)
    }
    
    func submit(_ answer: String) {
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
}

