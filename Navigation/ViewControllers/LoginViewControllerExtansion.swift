//
//  LoginViewControllerExtansion.swift
//  Navigation
//
//  Created by NikkiLodeon on 7/7/23.
//

import UIKit

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
