//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Modified by Mahmoud Shabana on 6/12/2020.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle! // True, False
        quizBrain.checkAnswer(userAnswer)
        
        //Set background color of button to display right or wrong
        if userAnswer == actualAnswer {
            //print("Right")
            sender.backgroundColor = UIColor.green
        } else {
            //print("Wrong")
            sender.backgroundColor = UIColor.red
        }
        
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
        } else {
            print("Quiz is Complete, Restarting!")
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        // Use this function to update the questionLabel text throughout our code
        questionLabel.text = quiz[questionNumber].text
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

