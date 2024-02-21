//
//  SettingsViewController.swift
//  CustomGRBViewHW3
//
//  Created by Иван Семикин on 01/02/2024.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet private var rgbView: UIView!
    
    @IBOutlet private var redLevelLabel: UILabel!
    @IBOutlet private var greenLevelLabel: UILabel!
    @IBOutlet private var blueLevelLabel: UILabel!
    
    @IBOutlet private var setRedLevelSlider: UISlider!
    @IBOutlet private var setGreenLevelSlider: UISlider!
    @IBOutlet private var setBlueLevelSlider: UISlider!
    
    weak var delegate: SettingsViewControllerDelegate?
    
    var backgroundColor: UIColor!
    
    private var red: CGFloat = 0
    private var green: CGFloat = 0
    private var blue: CGFloat = 0
    private var alpha: CGFloat = 0
    
    private var rgbLevels: UIColor {
        UIColor(
            red: CGFloat(red),
            green: CGFloat(green),
            blue: CGFloat(blue),
            alpha: CGFloat(alpha)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rgbView.layer.cornerRadius = 15
        rgbView.backgroundColor = backgroundColor
        
        setRGBComponentsFromColor(from: backgroundColor)
        setSliders()
    }
    
    @IBAction func redSliderAction() {
        redLevelLabel.text = String(format: "%.2f", setRedLevelSlider.value)
        red = CGFloat(setRedLevelSlider.value)
        rgbView.backgroundColor = rgbLevels
    }
    
    @IBAction func greenSliderAction() {
        greenLevelLabel.text = String(format: "%.2f", setGreenLevelSlider.value)
        green = CGFloat(setGreenLevelSlider.value)
        rgbView.backgroundColor = rgbLevels
    }
    
    @IBAction func blueSliderAction() {
        blueLevelLabel.text = String(format: "%.2f", setBlueLevelSlider.value)
        blue = CGFloat(setBlueLevelSlider.value)
        rgbView.backgroundColor = rgbLevels
    }
    
    @IBAction func doneButtonPressed() {
        delegate?.setRGBBackgroundView(withRed: red, green: green, blue: blue, alpha: alpha)
        dismiss(animated: true)
    }
}

private extension SettingsViewController {
    func setRGBComponentsFromColor(from color: UIColor) {
        color.getRed(
            &red,
            green: &green,
            blue: &blue,
            alpha: &alpha
        )
    }
    
    func setSliders() {
        setRedLevelSlider.value = Float(red)
        setGreenLevelSlider.value = Float(green)
        setBlueLevelSlider.value = Float(blue)
    }
}
