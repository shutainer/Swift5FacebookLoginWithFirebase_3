//
//  ViewController.swift
//  Swift5FacebookLoginWithFirebase_3
//
//  Created by 須藤英隼 on 2020/06/25.
//  Copyright © 2020 Eishun Sudo. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin
import Firebase

class ViewController: UIViewController, LoginButtonDelegate {

    
    
    let fbLoginButton: FBLoginButton = FBLoginButton()
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()
    

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        fbLoginButton.delegate = self
        fbLoginButton.frame = CGRect(x: view.frame.size.width/2 - view.frame.size.width, y: view.frame.size.width/4, width: view.frame.size.height/2, height: 30)
        fbLoginButton.permissions = ["public_profile,email"]
        view.addSubview(fbLoginButton)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.isNavigationBarHidden = true
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        if error == nil {
            if result?.isCancelled == true {
                return
            }
        }
        
        
        
        let credential = FacebookAuthProvider.credential(withAccessToken: AccessToken.current!.tokenString)
        
        Auth.auth().signIn(with: credential) { (result, errror) in
            if let error = error{
                return
            }
            
            self.displayName = result!.user.displayName!
            self.pictureURLString = result!.user.photoURL!.absoluteString
            UserDefaults.standard.set(1, forKey: "loginOK")
            UserDefaults.standard.set(self.displayName, forKey: "displayName")
            UserDefaults.standard.set(self.pictureURLString, forKey: "pictureURLString")
        }
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        <#code#>
    }

    //github試験用
    func Log() {
        print("gittest")
    }
    
    //さらに変更
    func Log2() {
        print("gittest")
    }
    
}

