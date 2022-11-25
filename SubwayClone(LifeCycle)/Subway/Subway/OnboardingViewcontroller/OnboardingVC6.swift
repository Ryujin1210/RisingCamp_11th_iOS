//
//  OnboardingVC6.swift
//  Subway
//
//  Created by 유원근 on 2022/10/28.
//

import UIKit

class OnboardingVC6: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Onboard6 VC")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Onboard6 VC Did Appear")
    }
        
    override func viewDidDisappear(_ animated: Bool) {
                super.viewDidDisappear(animated)
                
                print("Onboard6 VC Did Disappear")
    }
     
    @IBAction func onboardClickedbtn(_ sender: Any) {
        guard let nextVc = self.storyboard?.instantiateViewController(withIdentifier: "FirstPermissionCheck") else{return}
        nextVc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(nextVc, animated: true)
        
    }
        
}
