//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by ahmed sherif on 17/09/2021.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    var bmiResult: Float = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if (bmiResult < 18){
            adviceLabel.text = "eat more!"
            self.view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)
            
        } else if (bmiResult > 18 && bmiResult < 24) {
            adviceLabel.text = "you are good"
            self.view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            adviceLabel.text = "you should eat fewer"
            self.view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        
        resultLabel.text = String(format: "%.1f", bmiResult)
        
    }
    

    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
