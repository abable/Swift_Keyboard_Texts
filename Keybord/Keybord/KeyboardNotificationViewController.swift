//
//  KeyboardNotificationViewController.swift
//  Keybord
//
//  Created by Seungjun Lim on 29/05/2019.
//  Copyright © 2019 Seungjun Lim. All rights reserved.
//
// Notification.Name.UIKeyboardDidHide
// Notification.Name.UIKeyboardDidShow
// Notification.Name.UIKeyboardWillHide
// Notification.Name.UIKeyboardWillShow
// Notification.Name.UIKeyboardWillChangeFrame
// Notification.Name.UIKeyboardDidChangeFrame


import UIKit

class KeyboardNotificationViewController: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.keyboardWillShowNotification, object: nil, queue: OperationQueue.main) { (noti) in
            
            guard let userInfo = noti.userInfo else {return}
            
            guard let bounds = userInfo[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
                return
            }
            
            var inset = self.textView.textContainerInset
            inset.bottom = bounds.height
            self.textView.scrollIndicatorInsets = inset
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name.keyboardWillHideNotification, object: nil, queue: OperationQueue.main) { (noti) in
            var inset = self.textView.textContainerInset
            inset.bottom = 8
            self.textView.scrollIndicatorInsets = inset
        }
        
    }
}
