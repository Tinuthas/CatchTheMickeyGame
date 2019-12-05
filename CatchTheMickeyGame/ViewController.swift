//
//  ViewController.swift
//  CatchTheMickeyGame
//
//  Created by Marcus Vinicius Galdino Medeiros on 05/12/19.
//  Copyright © 2019 Marcus Vinicius Galdino Medeiros. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    @IBOutlet weak var mickey1: UIImageView!
    @IBOutlet weak var mickey2: UIImageView!
    @IBOutlet weak var mickey3: UIImageView!
    @IBOutlet weak var mickey4: UIImageView!
    @IBOutlet weak var mickey5: UIImageView!
    @IBOutlet weak var mickey6: UIImageView!
    @IBOutlet weak var mickey7: UIImageView!
    @IBOutlet weak var mickey8: UIImageView!
    @IBOutlet weak var mickey9: UIImageView!
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "Score: \(score)"
        addRecognizer()
        
        
        
        
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    func addRecognizer(){
        let images = [mickey1, mickey2, mickey3, mickey4, mickey5, mickey6, mickey7, mickey8, mickey9]
        for image in images {
            image?.isUserInteractionEnabled = true
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
            image?.addGestureRecognizer(recognizer)
        }
        
    }


}

