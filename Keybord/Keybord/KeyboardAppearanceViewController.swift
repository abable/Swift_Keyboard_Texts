//
//  KeyboardAppearanceViewController.swift
//  Keybord
//
//  Created by Seungjun Lim on 29/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class keyboardAppearanceViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func appearanceChanged(_ sender: UISegmentedControl) {
        inputField.resignFirstResponder()
        
        inputField.keyboardAppearance = UIKeyboardAppearance(rawValue: sender.selectedSegmentIndex) ?? .default
        
        inputField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        inputField.becomeFirstResponder()
    }
}
