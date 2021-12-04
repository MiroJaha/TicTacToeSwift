//
//  ViewController.swift
//  TicTacToe
//
//  Created by admin on 03/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    var player = 1
    var game = 9
    var buttons = [[UIButton]]()

    @IBOutlet weak var topLeft: UIButton!
    @IBOutlet weak var topCenter: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var centerLeft: UIButton!
    @IBOutlet weak var centerCenter: UIButton!
    @IBOutlet weak var centerRight: UIButton!
    @IBOutlet weak var bottomLeft: UIButton!
    @IBOutlet weak var bottomCenter: UIButton!
    @IBOutlet weak var bottomRight: UIButton!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buttons = [[topLeft,topCenter,topRight],
                   [centerLeft,centerCenter,centerRight],
                   [bottomLeft,bottomCenter,bottomRight]]
        for setOfButton in buttons {
            for button in setOfButton {
                button.backgroundColor = .gray
            }
        }
    }

    @IBAction func onClick(_ sender: Any) {
        let button = sender as! UIButton
        
        if player == 1{
            button.backgroundColor = .red
            button.isEnabled = false
            player = 2
        }
        else{
            button.backgroundColor = .blue
            button.isEnabled = false
            player = 1
        }
        checkWinner()
    }
    
    @IBAction func resetButton(_ sender: Any) {
        player = 1
        game = 9
        oneTime = 1
        self.winnerLabel.isHidden = true
        for setOfButton in buttons {
            for button in setOfButton {
                button.backgroundColor = .gray
                button.isEnabled = true
            }
        }
    }
    
    func checkWinner(){
        let colors = [UIColor.red,UIColor.blue]
        for color in colors {
            for i in 0..<buttons.count {
                if buttons[i][0].backgroundColor!.isEqual(color) && buttons[i][1].backgroundColor!.isEqual(color) && buttons[i][2].backgroundColor!.isEqual(color){
                    endGame(winner: "\(color.accessibilityName) Winns!!!")
                }
                if buttons[0][i].backgroundColor!.isEqual(color) && buttons[1][i].backgroundColor!.isEqual(color) && buttons[2][i].backgroundColor!.isEqual(color){
                    endGame(winner: "\(color.accessibilityName) Winns!!!")
                }
            }
            if buttons[0][0].backgroundColor!.isEqual(color) && buttons[1][1].backgroundColor!.isEqual(color) && buttons[2][2].backgroundColor!.isEqual(color){
                endGame(winner: "\(color.accessibilityName) Winns!!!")
            }
            if buttons[0][2].backgroundColor!.isEqual(color) && buttons[1][1].backgroundColor!.isEqual(color) && buttons[2][0].backgroundColor!.isEqual(color){
                endGame(winner: "\(color.accessibilityName) Winns!!!")
            }
        }
        game -= 1
        if game == 0{
            endGame(winner: "No Winner!!!")
        }
    }
    
    var oneTime = 1
    func endGame(winner: String){
        if oneTime == 1{
            oneTime = 0
            self.winnerLabel.isHidden = false
            self.winnerLabel.text = winner
            for setOfButton in buttons {
                for button in setOfButton {
                    button.isEnabled = false
                }
            }
        }
    }
    
}

