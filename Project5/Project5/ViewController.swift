//
//  ViewController.swift
//  Project5
//
//  Created by Yasmin on 11/01/22.
//

import UIKit

class ViewController: UITableViewController {
    
    var allWords = [String]()
    var usedWords = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(promptForAnswer))
        
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        if allWords.isEmpty {
            allWords = ["silkworm"]
        }
        startGame()
    }
    
    func startGame() {
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true) //remove as palavras anteriores
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        usedWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Word", for: indexPath)
        cell.textLabel?.text = usedWords[indexPath.row]
        return cell
    }
    
    @objc func promptForAnswer() {
        let askingAlertController = UIAlertController(title: "Enter answer", message: nil, preferredStyle: .alert)
        askingAlertController.addTextField()
        
        let submitAction = UIAlertAction(title: "submit", style: .default) {
            [weak self, weak askingAlertController] action in
            guard let answer = askingAlertController?.textFields?[0].text else { return }
            self?.submit(answer)
        }
        askingAlertController.addAction(submitAction)
        present(askingAlertController, animated: true)
    }
    
    func submit(_ answer: String) {
    }
}

