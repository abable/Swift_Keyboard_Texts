//
//  ReturnKeyViewController.swift
//  Keybord
//
//  Created by Seungjun Lim on 29/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class ReturnKeyViewController: UIViewController {
    
    @IBOutlet weak var firstInputField: UITextField!
    
    @IBOutlet weak var secondInputField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secondInputField.enablesReturnKeyAutomatically = true
        
    }
}

extension ReturnKeyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case firstInputField:
            secondInputField.becomeFirstResponder()
        case secondInputField:
            guard let keyword = secondInputField.text else {
                return true
            }
            
            guard let url = URL(string: "http://www.google.com/m/search?q=\(keyword)") else {
                return true
            }
            
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        default:
            break
        }
        
        return true
    }
}
