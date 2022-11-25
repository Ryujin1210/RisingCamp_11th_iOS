//
//  ViewController.swift
//  CarrotMarketClone(TableView)
//
//  Created by 유원근 on 2022/11/04.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var HometableView: UITableView!
    
    // let cellheigth: CGFloat = 1
    
    var itemList: [String] = [
        "전기 자전거", "장갑", "갤럭시 S22", "노스페이스 점퍼", "클래식 지쿠터 125cc", "1인 책상 의자 팝니다.", "더블 전기요 전기매트", "포켓몬 빵 뿌띠씰 판매", "삼성32인치 모니터", "옷 싸게 팔아요", "원목 옷장 싸게 팔아요", "뉴욕 웨이 WPC", "BMW Z4 20i"
    ]
    
    var itemPrice: [Int] = [
        300000, 10000, 750000, 50000, 1200000, 38000, 29000, 10000, 275000, 14000, 98000, 120000, 58000000
    ]
    
    var itemLocal: [String] = [
        "노원구 공릉1동", "상계2동", "중계동", "강북구 수유3동", "강북구 번동", "도봉구 창동", "성북구 장위동", "상계6,7동", "상계8동",
        "강북구 미아동", "상계8동", "상계10동", "상계동"
    ]
    
    var itemimage: [String] = [
        "이미지(1)", "이미지(2)", "이미지(3)", "이미지(4)", "이미지(5)", "이미지(6)",  "이미지(7)", "이미지(8)", "이미지(9)", "이미지(10)", "이미지(11)", "이미지(12)", "이미지(13)"
    ]
    
    
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: number))!
        
        return result
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        HometableView.delegate = self
        HometableView.dataSource = self
        HometableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        
    }

}

//추가기능 (연장선)
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    //몇개인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemList.count
    }
    
    //어케줄건지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: "HomeTableViewCell",
            for: indexPath
        )as? HomeTableViewCell
        else { return UITableViewCell() }
        
        cell.itemTitle.text = itemList[indexPath.row]
        cell.itemPrice.text = numberFormatter(number: itemPrice[indexPath.row]) + "원"       //0 번째 -> itemList[0]
        cell.itemLocal.text = itemLocal[indexPath.row]
        cell.homeitemimage.image = UIImage(named: itemimage[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itemList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert{
            
        }
    }
    
    
    
    /*func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return cellheigth
    }*/
}

