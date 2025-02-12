//
//  BaseViewController.swift
//  Impoort-IOS
//
//  Created by Yusuf ali cezik on 5.10.2019.
//  Copyright © 2019 Yusuf Ali Cezik. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        //self.addSwipeRightDismissRecognizer()
        //self.addSwipeLeftDismissRecognizer()
    }
    
    func goToRegisterFirstStep(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterFirstVC") as? RegisterFirstStepViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }
    func goToRegisterSecondStep(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterSecondVC") as? RegisterSecondStepViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }
    func goToRegisterThirdStep(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterThirdVC") as? RegisterThirdStepViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }

    func goToBack(){
        if let navBar = self.navigationController{
            navBar.popViewController(animated: true)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func goToLogin(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as? LoginViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    func goToHome(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as? UITabBarController
        vc?.selectedIndex = 0
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    func goToMessagesGeneral(){
        let storyboard = UIStoryboard(name: "External", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MessagesGeneralVC") as? MessagesGeneralViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }
    
    func goToChatVC(){ //id de gönderilecek. mesajlasılan kisinin.
        let storyboard = UIStoryboard(name: "External", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ChatVC") as? ChatViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
        
    }
    func goToSettingsVC(){  //id gönderilebilir. me or other
        let storyboard = UIStoryboard(name: "External", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingsVC") as? SettingsViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
        
    }
    func addSwipeDismiss(vc:UIViewController){
        let swipeGesture = UISwipeGestureRecognizer(target: vc, action: #selector(dismissView))
        vc.view.isUserInteractionEnabled = true
        swipeGesture.direction = .right
        vc.view.addGestureRecognizer(swipeGesture)
    }
    @objc private func dismissView(){
        
        self.goToBack()
    }
    func goToPostDetailVC(){
        let storyboard = UIStoryboard(name: "Tools", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "PostDetailVC") as? PostDetailViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }
    func goToCommentViewController(){
        let storyboard = UIStoryboard(name: "Tools", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "CommentVC") as? CommentViewController
        self.present(vc!, animated: true, completion: nil)
    }
    
    
    func addSwipeLeftDismissRecognizer(){
        let sw = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
        sw.direction = .right
        self.view.addGestureRecognizer(sw)
    }
    @objc private func swipeToLeft(){
        if let tabbarVc = self.tabBarController{
            if tabbarVc.selectedIndex > 0{
                (tabbarVc as? TabBarViewController)?.set(selectedIndex: tabbarVc.selectedIndex-1)
                //tabbarVc.selectedIndex = tabbarVc.selectedIndex-1 //swipe left.
            }
        }
    }
    func addSwipeRightDismissRecognizer(){
        let sw = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
        sw.direction = .left
        self.view.addGestureRecognizer(sw)
    }
    @objc private func swipeToRight(){
        if let tabbarVc = self.tabBarController{
            if tabbarVc.selectedIndex < 4{
                (tabbarVc as? TabBarViewController)?.set(selectedIndex: tabbarVc.selectedIndex+1)
                //tabbarVc.selectedIndex = tabbarVc.selectedIndex+1 //swipe left.
            }
        }
    }
    func goToProfileDetails(){
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ProfileDetailVC") as? ProfileViewController
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }
    func goToProfile(_ id:Int){ //id alıancak params olarak ve vc.id ye verilecek
        let storyboard = UIStoryboard(name: "Home", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "NewProfileVC") as? NewProfileViewController
        
            vc?.profileID = id
            self.present(vc!, animated: true, completion: nil)
        
    }
    func clearHeader(){
        UIView.animate(withDuration: 0.3){
            //self.headerView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            UIApplication.shared.statusBarView?.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearHeader()
    }
    
    func goToSettingsDetailVC(title:String, propertyList:[String]){
        let storyboard = UIStoryboard(name: "External", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingsDetailVC") as? SettingsDetailViewController
        vc?.titleString = title
        vc?.propertyList = propertyList
        if let navBar = self.navigationController{
            navBar.pushViewController(vc!, animated: true)
        }else{
            self.present(vc!, animated: true, completion: nil)
        }
    }

}

class RegisteredUser{
    static let shared = RegisteredUser()
    var user = User()
}

extension UIApplication {
    var statusBarView: UIView? {
        if responds(to: Selector("statusBar")) {
            return value(forKey: "statusBar") as? UIView
        }
        return nil
    }
}
