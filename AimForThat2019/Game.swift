//
//  ViewController.swift
//  AimForThat2019
//
//  Created by ONCLICKMX11 on 4/13/19.
//  Copyright © 2019 ONCLICKMX11. All rights reserved.
//

import UIKit

class Game: UIViewController {
    
    var valueSlider : Int = 0
    var targetValue : Int = 0
    var score : Int = 0
    var round: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblTarget: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    @IBOutlet weak var lblRound: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSlider()
        
        resetGame()
        updateLabels()
    }
    
    func setupSlider(){
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal" )
        let thumbHighlighted = UIImage(named: "SliderThumb-Highlighted")
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackRightImage = UIImage (named: "SliderTrackRight")
        
        self.slider.setThumbImage(thumbImageNormal, for: .normal)
        self.slider.setThumbImage(thumbHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)

        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: insets)
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: insets)

        self.slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        self.slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
    }

    @IBAction func btnShowAlert() {
        /*
        var difference: Int = 0
        
        if (valueSlider > targetValue){
            difference = valueSlider - targetValue
        }
        else{
            difference = targetValue - valueSlider
        }
        */
        let difference : Int = abs(self.valueSlider - targetValue)
        
        var points = (difference > 0) ? 10 - difference : 100
        
        let title : String
        
        switch difference{
            case 0:
                title = "Punctuación perfecta"
                points = 10 * points
            case 1...5:
                title = "Casi perfecto!!!"
                points = Int (1.5 * Double(points))
            case 6...12:
                title = "Te ha faltado poco..."
            points = Int (1.2 * Double(points))
            default:
                title = "Has ido lejos..."
        }
        
        let messageValueSlider = "Haz marcado \(points) puntos"
        
        self.score += points
        
        
        
        let alert = UIAlertController(title: title, message: messageValueSlider, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok!!!", style: .default, handler:
        { action in
            self.startNewRound()
            self.updateLabels()
        })
        
        alert.addAction(action)
        
        
        present(alert, animated: true)
        
        
    }
    
    @IBAction func sliderMove(_ sender: UISlider) {
        self.valueSlider = lroundf(sender.value)
    }
    
    func startNewRound(){
        // arc4random_uniform(100) -> genera un nùmero flotante aletario entre cero y nueve
        // 1 + Int -> Se hace un casteo a entero y se le suma uno para que los valores esten entre uno y diez
        targetValue = 1 + Int(arc4random_uniform(10))
        self.valueSlider = 5
        self.slider.value = Float(self.valueSlider)
        self.round += 1
    }
    
    func updateLabels(){
        self.lblTarget.text = "\(self.targetValue)"
        self.lblScore.text = "\(self.score)"
        self.lblRound.text = "\(self.round)"
    }
    
    @IBAction func btnStartNewGame(){
        resetGame()
        updateLabels()
    }
    
    func resetGame(){
        self.score = 0
        self.round = 0
        self.startNewRound()
    }
}

