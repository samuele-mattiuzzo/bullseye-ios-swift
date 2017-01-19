//
//  ViewController.swift
//  BullsEye
//
//  Created by Samuele Mattiuzzo on 12/01/2017.
//  Copyright © 2017 Samuele Mattiuzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let scoreModifier: Int = 100
    
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
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable =
            trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable =
            trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)

        startNewGame()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func startNewGame() {
        // resets the counters and prepares for a new game
        currentValue = 0
        currentScore = 0
        currentRound = 1
        slider.value = Float(0.5)
        
        _randomizeValue()
        _updateLabels()
    }
    
    func startNewRound() {
        // resets the slider and randomizes a new target value
        currentRound += 1
        slider.value = Float(0.5)

        _randomizeValue()
        _updateLabels()
    }
    
    func _randomizeValue() {
        currentValue = 1 + Int(arc4random_uniform(100))
    }

    func _sliderMoved() {
        currentGuess = lroundf(slider.value * 100)
    }

    func _updateLabels() {
        // updates the labels of score, rounds and current value
        currentLabel.text = String(currentValue)
        scoreLabel.text = String(currentScore)
        roundLabel.text = String(currentRound)
    }
    
    func _updateScores() {
        let difference = Int(abs(currentGuess - currentValue))
        let roundScore = scoreModifier - difference
        currentScore += roundScore
    }
    
   func showAlert() {
        let message = "The value of the slider is: \(currentGuess)\n"
            + "The target value is: \(currentValue)\n"
        
        let alert = UIAlertController(title: "Bull's Eye",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "Continue",
                                   style: .default,
                                   handler: { (ok: UIAlertAction!) in self.startNewRound() })
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

    @IBAction func hitMe() {
        _sliderMoved()
        _updateScores()
        showAlert()
    }
    
    @IBAction func resetMe() {
        startNewGame()
    }
}

