//
//  FirstPageController.swift
//  senlaHometask4
//
//  Created by Сергей Хмизюк on 01.04.2022.
//

import Foundation
import UIKit

class FirstPageController: UIViewController {
    
    @IBOutlet weak var secondPlayer: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var gameResult: UILabel!
    @IBOutlet weak var retryButtom: UIButton!
    var firstScore = 0
    var secondScore = 0
    var blockDraw = false
    var languageSelected = 0
    
    func setBlockDraw(state: Bool) {
        blockDraw = state
        print("change state to \(blockDraw)")
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "vc1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "vc1",
            let secondViewController = segue.destination as? SettingController {
            secondViewController.firstPageController = self
            }
    }
    
    @IBAction func retryAction(_ sender: UIButton) {
        firstScore = 0
        secondScore = 0
        score.text = "\(firstScore)-\(secondScore)"
        secondPlayer.text = "❓"
        gameResult.text = ""
        sender.isHidden = true
    }
    
    @IBAction func changeSecondPlayer1(_ sender: UIButton) {
        let first = 1
        changeSecondPlayerAction(first: first)
    }
    
    @IBAction func changeSecondPlayer2(_ sender: Any) {
        let first = 2
        changeSecondPlayerAction(first: first)
    }
    
    @IBAction func changeSecondPlayer3(_ sender: Any) {
        let first = 3
        changeSecondPlayerAction(first: first)
    }
    
    func changeSecondPlayerAction(first: Int) {
        print("in changeSecondPlayerAction() state is \(blockDraw)")
        if (secondScore == 3 || firstScore == 3) {
            return
        }
        var second = Int.random(in: 1...3)
        if (blockDraw == true) {
            if (first == second) {
                second += 1
            }
        }
        switch second {
        case 1:
            secondPlayer.text = "💎"
        case 2:
            secondPlayer.text = "✂️"
        case 3:
            secondPlayer.text = "📃"
        default:
            secondPlayer.text = "💎"
        }
        if (first == second) {
            return
        }
        else if (first == 3 && second == 1) {
            firstScore += 1
        }
        else if (first == 1 && second == 3) {
            secondScore += 1
        }
        else if (first < second) {
            firstScore += 1
        }
        else if (second < first) {
            secondScore += 1
        }
        score.text = "\(firstScore)-\(secondScore)"
        printResult()
    }
    
    func changePlayLangeage() {
        printResult()
    }
    
    func printResult() {
        if languageSelected == 1 {
            if (firstScore == 3) {
                gameResult.text = "You are win!"
                retryButtom.isHidden = false
            }
            else if (secondScore == 3) {
                gameResult.text = "You are lose..."
                retryButtom.isHidden = false
            }
            retryButtom.setTitle("Retry", for: .normal)
        }
        else {
            if (firstScore == 3) {
                gameResult.text = "Вы победили!"
                retryButtom.isHidden = false
            }
            else if (secondScore == 3) {
                gameResult.text = "Вы проиграли..."
                retryButtom.isHidden = false
            }
            retryButtom.setTitle("Повторить", for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameResult.text = ""
    }
}
