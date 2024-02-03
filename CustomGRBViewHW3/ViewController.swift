//
//  ViewController.swift
//  CustomGRBViewHW3
//
//  Created by Иван Семикин on 01/02/2024.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var rgbView: UIView!
    
    @IBOutlet var redLevelLabel: UILabel!
    @IBOutlet var greenLevelLabel: UILabel!
    @IBOutlet var blueLevelLabel: UILabel!
    
    @IBOutlet var setRedLevelSlider: UISlider!
    @IBOutlet var setGreenLevelSlider: UISlider!
    @IBOutlet var setBlueLevelSlider: UISlider!
    
    private var rgbLevels: UIColor {
        return UIColor(
            red: CGFloat(setRedLevelSlider.value),
            green: CGFloat(setGreenLevelSlider.value),
            blue: CGFloat(setBlueLevelSlider.value),
            alpha: 1.0
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbView.layer.cornerRadius = 15
        rgbView.backgroundColor = rgbLevels
    }

    @IBAction func redSliderAction() {
        redLevelLabel.text = String(format: "%.2f", setRedLevelSlider.value)
        rgbView.backgroundColor = rgbLevels
    }
    
    @IBAction func greenSliderAction() {
        greenLevelLabel.text = String(format: "%.2f", setGreenLevelSlider.value)
        rgbView.backgroundColor = rgbLevels
    }
    
    @IBAction func blueSliderAction() {
        blueLevelLabel.text = String(format: "%.2f", setBlueLevelSlider.value)
        rgbView.backgroundColor = rgbLevels
    }
}

