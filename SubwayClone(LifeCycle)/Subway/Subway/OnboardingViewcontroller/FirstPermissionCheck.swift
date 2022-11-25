//
//  FirstPermissionCheck.swift
//  Subway
//
//  Created by 유원근 on 2022/10/29.
//

import UIKit

class FirstPermissionCheck: UIViewController{
    
    override func viewDidLoad() {
        
    }

   
    @IBAction func Permissionchecked(_ sender: Any) {
    guard let nextVc2 = self.storyboard?.instantiateViewController(withIdentifier: "MainOnboardingVC2") else{return}
        nextVc2.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(nextVc2, animated: true)
        
    }
    
}

