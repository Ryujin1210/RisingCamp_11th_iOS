//
//  HomeTableViewCell.swift
//  CarrotMarketClone(TableView)
//
//  Created by 유원근 on 2022/11/04.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var itemPrice: UILabel!
    
    @IBOutlet weak var homeitemimage: UIImageView!
    
    @IBOutlet weak var itemLocal: UILabel!
    
    @IBOutlet weak var itemTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            
        // Configure the view for the selected state
    }
    
    //간격
    override func layoutSubviews() {
      super.layoutSubviews()
      contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0))
    }
    
    /*override func prepareForReuse() {
        super.prepareForReuse()

            // 셀을 초기화 해주는 코드. dequeuereuse 연관
    }*/
}
