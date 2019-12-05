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
    var images = [UIImageView]()
    
    var score = 0
    var timer = Timer()
    var counter = 0
    var hideTimer = Timer()
    var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkHighScore()
        images = [mickey1, mickey2, mickey3, mickey4, mickey5, mickey6, mickey7, mickey8, mickey9]
        addRecognizer()
        initValues()
    }
    
    @objc func increaseScore(){
        score += 1
        scoreLabel.text = "Score: \(score)"
    }
    
    @objc func countDown(){
        counter -= 1
        timeLabel.text = "\(counter)"
        if counter == 0{
            timer.invalidate()
            hideTimer.invalidate()
            
            for image in images {
                image.isHidden = true
            }
            // HighScore
            checkHighScore()
            
            // Alert
            let alert = UIAlertController(title: "Time's Up", message: "Do you want to play again?", preferredStyle: UIAlertController.Style.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
            let replayButton = UIAlertAction(title: "Replay", style: UIAlertAction.Style.default) { (UIAlertAction) in
                 // replay function
                self.initValues()
            }
            alert.addAction(okButton)
            alert.addAction(replayButton)
            self.present(alert, animated: true, completion: nil)
            
        }
    }
    
    func addRecognizer(){
        
        for image in images {
            image.isUserInteractionEnabled = true
            let recognizer = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
            image.addGestureRecognizer(recognizer)
        }
        
    }
    
    @objc func hideMickey(){
        for image in images {
            image.isHidden = true
        }
        
        let random = Int(arc4random_uniform(UInt32(images.count - 1)))
        images[random].isHidden = false
    }
    
    func initValues(){
        //Score
        score = 0
        scoreLabel.text = "Score: \(score)"
        
        //Timers
        counter = 10
        timeLabel.text = "\(counter)"
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
        hideMickey()
        hideTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideMickey), userInfo: nil, repeats: true)
    }
    
    func checkHighScore(){
        if score > highScore{
            self.highScore = score
            //highScoreLabel.text = "Highscore: \(highScore)"
            UserDefaults.standard.set(highScore, forKey: "highscore")
        }
        
        let storedHighScore = UserDefaults.standard.object(forKey: "highscore")
        
        if storedHighScore == nil {
            highScore = 0
            highScoreLabel.text = "HighScore: \(highScore)"
        }
        
        if let newScore = storedHighScore as? Int {
            highScore = newScore
            highScoreLabel.text = "Highscore \(highScore)"
        }
    }


}

