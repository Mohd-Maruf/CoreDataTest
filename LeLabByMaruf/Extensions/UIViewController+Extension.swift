//
//  UIViewController+Extension.swift
//  LeLabByMaruf
//
//  Created by Mohammad Maruf on 27/04/21.
//  Copyright © 2021 Mohammad Maruf. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(_ title: String?, message: String?, _ completion: @escaping (() -> ())) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
            completion()
        }
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    func showInformationAlert(_ title: String? = nil, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
        let okAction = UIAlertAction(title: "Ok", style: .default) { (_) in
        }
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
}
