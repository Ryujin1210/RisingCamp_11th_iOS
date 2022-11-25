//
//  CollectionViewCell.swift
//  AnimalHos
//
//  Created by 유원근 on 2022/11/18.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellNumber: UILabel!
    @IBOutlet weak var cellName: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        prepareForReuse()
    }

}
