//
//  CreateUsernameViewController.swift
//  Makestagram
//
//  Created by Yash on 7/11/18.
//  Copyright © 2018 Yash. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateUsernameViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        guard let firUser = Auth.auth().currentUser,
            let username = usernameTextField.text,
            !username.isEmpty else {return}
        
//        UserService.create(firUser, username: username){ (user) in
//            guard let user = user
//                else {return}
//        }
//
//        User.setCurrent(user)
//
//        let storyboard = UIStoryboard(name: "Main", bundle: .main)
//        if let initialViewController = storyboard.instantiateInitialViewController(){
//            self.view.window?.rootViewController = initialViewController
//            self.view.window?.makeKeyAndVisible()
//        }
        
        UserService.create(firUser, username: username){ (user) in
            guard let user = user else{
                return
            }
            
            User.setCurrent(user)
            
            let storyboard = UIStoryboard(name: "Main", bundle: .main)
            if let initialViewController = storyboard.instantiateInitialViewController(){
                self.view.window?.rootViewController = initialViewController
                self.view.window?.makeKeyAndVisible()
            }
            
//            let initialViewController = UIStoryboard.initialViewController(for: .main)
//            self.view.window?.rootViewController = initialViewController
//            self.view.window?.makeKeyAndVisible()
            
        }
    }
    
    
    
    
}

