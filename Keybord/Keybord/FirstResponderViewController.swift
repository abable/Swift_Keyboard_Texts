//
//  FirstResponderViewController.swift
//  Keybord
//
//  Created by Seungjun Lim on 29/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//

import UIKit

class FirstResponderViewController: UIViewController {
    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func startEditing(_ sender: Any) {
        inputField.becomeFirstResponder()
    }
    
    @IBAction func endEditing(_ sender: Any) {
        if inputField.isFirstResponder {
            inputField.resignFirstResponder()
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        inputField.becomeFirstResponder()

    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
//        if inputField.isFirstResponder {
//            inputField.resignFirstResponder()
//        }
        view.endEditing(true)
    }
    
    
    // 이렇게 해주는것은 좋은 습관입니다. 화면전환시 어차피 없어지지만 이렇게 해줌으로써 약간의 딜레이를 방지 할수 있다.
}
