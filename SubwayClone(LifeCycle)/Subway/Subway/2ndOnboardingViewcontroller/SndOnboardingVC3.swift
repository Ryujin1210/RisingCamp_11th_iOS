//
//  SndOnboardingVC3.swift
//  Subway
//
//  Created by 유원근 on 2022/10/29.
//

import UIKit

class SndOnboardingVC3: UIViewController{
    
    @IBAction func CloseClicked(_ sender: Any) {
    guard let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "TapBarController") else{return}
        nextVc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(nextVc, animated: true)
    }
}
