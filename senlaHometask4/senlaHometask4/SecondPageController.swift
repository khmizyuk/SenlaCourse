//
//  SecondPageController.swift
//  senlaHometask4
//
//  Created by Сергей Хмизюк on 01.04.2022.
//

import Foundation
import UIKit

class SecondPageController: UIViewController {
    
    @IBOutlet weak var one: UILabel!
    @IBOutlet weak var two: UILabel!
    @IBOutlet weak var three: UILabel!
    @IBOutlet weak var four: UILabel!
    @IBOutlet weak var five: UILabel!
    @IBOutlet weak var six: UILabel!
    var generateButtonIsTapped = false
    
    @IBAction func generateButtonAction(_ sender: UIButton) {
        
        generateButtonIsTapped = !generateButtonIsTapped
        if generateButtonIsTapped {
            
            one.isHidden = true
            two.isHidden = true
            three.isHidden = true
            four.isHidden = true
            five.isHidden = true
            six.isHidden = true
            
            let number = Int.random(in: 1...6)
            switch number {
            case 1:
                one.isHidden = false
            case 2:
                two.isHidden = false
            case 3:
                three.isHidden = false
            case 4:
                four.isHidden = false
            case 5:
                five.isHidden = false
            default:
                six.isHidden = false
            }
            sender.setTitle("Сбросить", for: .normal)
        }
        else {
            one.isHidden = false
            two.isHidden = false
            three.isHidden = false
            four.isHidden = false
            five.isHidden = false
            six.isHidden = false
            sender.setTitle("Бросить кубик", for: .normal)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
