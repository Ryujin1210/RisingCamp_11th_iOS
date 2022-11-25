//
//  CellStruct.swift
//  AnimalHos
//
//  Created by 유원근 on 2022/11/18.
//

import Foundation
import UIKit

struct HSModel{
    let image : UIImage?
    let Name : String?
    let Address : String?
    
    init(image: UIImage?, Name: String?, Address: String?) {
        self.image = image
        self.Name = Name
        self.Address = Address
    }
}
