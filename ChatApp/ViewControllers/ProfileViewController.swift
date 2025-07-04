//
//  ProfileViewController.swift
//  ChatApp
//
//  Created by Philips on 04/07/25.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
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
