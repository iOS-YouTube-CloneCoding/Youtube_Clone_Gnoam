//
//  TextFieldReturnDelegate.swift
//  assignmentYoutube
//
//  Created by Roh on 4/6/24.
//

import UIKit

protocol TextFieldReturnDelegate: UITextFieldDelegate where Self: UIViewController {
//    func textFieldShouldReturn(_ textFields: [UITextField]) -> Bool
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
}


