//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Ahmed Sherif on 12/09/2021.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var TrueButton: UIButton!
    @IBOutlet weak var FalseButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var quizbrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        
        let answerCheked = quizbrain.checkAnswer(userAnswer)
        
        if (answerCheked){
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }

        quizbrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI () {
        questionLabel.text = quizbrain.getquestion()
        scoreLabel.text = " Score: \(quizbrain.getScore())"
        progressBar.progress = quizbrain.calculateProgress()
        
        TrueButton.backgroundColor = UIColor.clear
        FalseButton.backgroundColor = UIColor.clear
    }
}


