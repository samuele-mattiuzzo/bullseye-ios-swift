//
//  ViewController.swift
//  BullsEye
//
//  Created by Samuele Mattiuzzo on 12/01/2017.
//  Copyright © 2017 Samuele Mattiuzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    var currentValue: Int = 0
    @IBOutlet weak var currentLabel: UILabel!
    
    var currentGuess: Int = 0
    @IBOutlet weak var guessLabel: UILabel!
    
    var currentScore: Int = 0
    @IBOutlet weak var scoreLabel: UILabel!
    
    var currentRound: Int = 0
    @IBOutlet weak var roundLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound()
        currentGuess = lroundf(slider.value * 100)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func _randomizeValue() {
        currentValue = 1 + Int(arc4random_uniform(100))
    }
    
    func startNewRound() {
        _randomizeValue()
        slider.value = Float(0.5)
    }
    
    @IBAction func showAlert() {
        let message = "The value of the slider is now \(currentGuess), the target value is \(currentValue)"
        
        let alert = UIAlertController(title: "Bull's Eye", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved() {
        currentGuess = lroundf(slider.value * 100)
    }


}

