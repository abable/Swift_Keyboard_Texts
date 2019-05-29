//
//  KeyboardTypesViewController.swift
//  Keybord
//
//  Created by Seungjun Lim on 29/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class KeyboardTypesViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func changeKeyboardType(_ sender: Any) {
        inputField.resignFirstResponder() // 키보드를 사라지게 하고,
        
        let sheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let types: [UIKeyboardType] = [.default, .asciiCapable, .numbersAndPunctuation, .URL, .numberPad, .phonePad, .namePhonePad, .emailAddress, .decimalPad, .twitter, .webSearch, .asciiCapableNumberPad]
        let typeNames = ["Default", "ASCII Capable", "Numbers And Punctuation", "URL", "Number Pad", "Phone Pad", "Name Phone Pad", "E-mail Address", "Decimal Pad", "Twitter", "Web Search", "ASCII Capable Number Pad"]
        
        (0..<types.count).forEach {
            let type = types[$0]
            let name = typeNames[$0]
            
            let action = UIAlertAction(title: name, style: .default, handler: { (action) in
                self.inputField.keyboardType = type
                self.inputField.becomeFirstResponder() // 다시 키보드를 호출한다 이유는 키보드 속성은 키보드가 나와있는동안에는 적용되지 않으므로..
            })
            sheet.addAction(action)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        sheet.addAction(cancel)
        
        present(sheet, animated: true, completion: nil)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        inputField.becomeFirstResponder()
    }
    
}
