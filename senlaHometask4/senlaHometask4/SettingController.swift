//
//  SettingController.swift
//  senlaHometask4
//
//  Created by Сергей Хмизюк on 01.04.2022.
//

import Foundation
import UIKit

class SettingController: UIViewController {

    @IBOutlet weak var settingSwitch: UISwitch!
    @IBOutlet weak var languageSelected: UISegmentedControl!

    var firstPageController = FirstPageController()
    
    @IBAction func changeLangeage(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex
        {
        case 0:
            firstPageController.languageSelected = 0
        case 1:
            firstPageController.languageSelected = 1
        default:
            break
        }
        firstPageController.changePlayLangeage()
    }
    
    @IBAction func changeSetting(_ sender: UISwitch) {
        if (sender.isOn == true) {
            firstPageController.setBlockDraw(state: true)
        }
        else {
            firstPageController.setBlockDraw(state: false)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingSwitch.isOn = firstPageController.blockDraw
        languageSelected.selectedSegmentIndex = firstPageController.languageSelected
    }
    
}
