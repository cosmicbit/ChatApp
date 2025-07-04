//
//  HomeViewController.swift
//  ChatApp
//
//  Created by Gwinyai Nyatsoka on 21/7/2023.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func logout() {
        do{
            try Auth.auth().signOut()
            let authStoryboard = UIStoryboard(name: "Auth", bundle: nil)
            let signinVC = authStoryboard.instantiateViewController(withIdentifier: "SignInViewController")
            let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
            window?.rootViewController = signinVC
        } catch {
            presentErrorAlert(title: "Log out Failed", message: "Something went wrong with logout. Please try again later.")
        }
    }

    @IBAction func logOutButtonTapped(_ sender: Any) {
        let logoutAlert = UIAlertController(title: "Confirm Logout", message: "Are you sure you would like to log out of your account? ", preferredStyle: .alert)
        let logoutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            self.logout()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        logoutAlert.addAction(logoutAction)
        logoutAlert.addAction(cancelAction)
        present(logoutAlert, animated: true)
        
    }
}
