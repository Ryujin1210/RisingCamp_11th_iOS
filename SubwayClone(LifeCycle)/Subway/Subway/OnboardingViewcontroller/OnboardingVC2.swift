//
//  OnboardingVC2.swift
//  Subway
//
//  Created by 유원근 on 2022/10/28.
//

import UIKit

class OnboardingVC2: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Onboard2 VC")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Onboard2 VC Did Appear")
    }
        
    override func viewDidDisappear(_ animated: Bool) {
                super.viewDidDisappear(animated)
                
                print("Onboard2 VC Did Disappear")
    }
            
        
}
