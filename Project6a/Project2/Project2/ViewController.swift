//
//  ViewController.swift
//  Project2
//
//  Created by Yasmin on 29/11/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        
        askQuestion()
        
        setTitle()
       
    }
    
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        setTitle()
        

    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        if score == 10 {
            title = "Parabéns, você respondeu 10 questões!"
        }
        else if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong, this flag is \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        setTitle()
    }
    
    func setTitle() {
        let label = UILabel()
        label.backgroundColor = .clear
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Your score is \(score) \n Choose the correct flag: \(countries[correctAnswer].uppercased())"
        self.navigationItem.titleView = label
    }
    

}

