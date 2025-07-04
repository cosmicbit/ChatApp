//
//  Extension+UIViewController.swift
//  ChatApp
//
//  Created by Philips on 04/07/25.
//

import Foundation
import UIKit

extension UIViewController {
    
    func presentErrorAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func showLoadingView() {
        let loadingView = LoadingView()
        
        loadingView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        loadingView.tag = 20251220
        view.addSubview(loadingView)
    }
    
    func removeLoadingView() {
        if let loadingView = view.viewWithTag(20251220) {
            loadingView.removeFromSuperview()
        }
    }
}
