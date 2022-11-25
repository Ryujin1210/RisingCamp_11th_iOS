//
//  MainPageViewController.swift
//  Subway
//
//  Created by 유원근 on 2022/10/29.
//

import UIKit

class MainPage: UIViewController{
    override func viewDidLoad() {
        let imageView = UIImageView(frame: CGRect(x:0, y:0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "Subway")
        imageView.image = image
        navigationItem.titleView = imageView
    }
    
}

