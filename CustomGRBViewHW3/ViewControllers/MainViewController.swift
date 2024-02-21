//
//  MainViewController.swift
//  CustomGRBViewHW3
//
//  Created by Иван Семикин on 21/02/2024.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setRGBBackgroundView(
        withRed red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat
    )
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        
        settingsVC?.backgroundColor = view.backgroundColor
        settingsVC?.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    func setRGBBackgroundView(withRed red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        view.backgroundColor = UIColor(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
}
