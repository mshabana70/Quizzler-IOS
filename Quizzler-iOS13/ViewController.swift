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
    
    let quiz = [
        ["Four + Two is equal to Six", "True"],
        ["Five - Three is greater than One", "True"],
        ["Thirteen + Five is less than Eleven", "False"]
    ]
    
    // Question Number, will be used to retrieve question from quiz array
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func answerBtnPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle // True, False
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right")
        } else {
            print("Wrong")
        }
        
        if questionNumber < (quiz.count - 1) {
            questionNumber += 1
        } else {
            print("Quiz is Complete, Restarting!")
            questionNumber = 0
        }
        
        updateUI()
    }
    
    func updateUI() {
        // Use this function to update the questionLabel text throughout our code
        questionLabel.text = quiz[questionNumber][0]
    }
    
}

