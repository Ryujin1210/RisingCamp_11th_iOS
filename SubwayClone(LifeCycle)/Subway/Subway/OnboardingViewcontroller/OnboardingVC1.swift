//
//  OnboardingVC1.swift
//  Subway
//
//  Created by 유원근 on 2022/10/28.
//

import UIKit

class OnboardingVC1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Onboard1 VC")
    }
   
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("Onboard1 VC Did Appear")
    }
        
    override func viewDidDisappear(_ animated: Bool) {
                super.viewDidDisappear(animated)
                
                print("Onboard1 VC Did Disappear")
    }
            
        
}
