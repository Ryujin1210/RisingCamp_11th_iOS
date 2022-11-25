//
//  ViewController1.swift
//  AnimalHos
//
//  Created by 유원근 on 2022/11/18.
//

import Foundation
import AFNetworking
import UIKit

class HospitalcollectionVc: UIViewController{
    
    @IBOutlet weak var CollectionView: UICollectionView!
    
    var List: HospitalResponse? = nil
    
    var HosName:String = ""
    var HosNumber:String = ""
    let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    var imageList: [String] = [
        "images-1","images-2","images-3","images-4","images-5","images-6",
        "images-7","images-8","images-9","images-10","images-11",
        "images-12","images-13","images-14","images-15","images-16",
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        HospitalRequest().getHospitalData(self)
        collectionViewDelegate()
        self.CollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
    }
}

extension HospitalcollectionVc: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //let Row = self.List[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.cellImage.image = UIImage(named: imageList[indexPath.row])
        cell.cellName.text = HosName
        cell.cellNumber.text = HosNumber
        
        
        
        return cell
    }
    //MARK: - 셀 사이즈
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
            let width = collectionView.frame.width
            let height = collectionView.frame.height
            let itemsPerRow: CGFloat = 2
            let widthPadding = sectionInsets.left * (itemsPerRow )
            let itemsPerColumn: CGFloat = 3
            let heightPadding = sectionInsets.top * (itemsPerColumn + 1)
            let cellWidth = (width - widthPadding) / itemsPerRow
            let cellHeight = (height - heightPadding) / itemsPerColumn
                
                return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    func collectionViewDelegate() {
        self.CollectionView.delegate = self
        self.CollectionView.dataSource = self
    }
    
}

extension HospitalcollectionVc {
    func didSuccess(_ response: HospitalResponse) {
       /*
        var i = 0
        while i <= response.localdata020301.row.count {
            HosName[i] = response.localdata020301.row[i].bplcnm
            HosNumber[i] = response.localdata020301.row[i].sitewhladdr
            i += 1
        }
        */
        HosNumber = response.localdata020301.row[2].sitewhladdr
        HosName = response.localdata020301.row[1].bplcnm
    }

}
