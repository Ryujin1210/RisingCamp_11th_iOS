//
//  ViewController.swift
//  CasinoRoullete
//
//  Created by 유원근 on 2022/11/09.
//

import UIKit
import SwiftUI
//MARK: - 선언 부

class PickerViewController: UIViewController {
    @IBOutlet weak var RestartBtn: UIImageView!
    @IBOutlet weak var Picker: UIPickerView!
    @IBOutlet weak var Background: UIImageView!
    @IBOutlet weak var StartBtn: UIButton!
    @IBOutlet weak var Money: UILabel!
    @IBOutlet weak var PlayTimes: UILabel!
    
    var ButtonState = false
    var GameMoney = 50000
    var time = 0
    var reset = true
    //print(numberFormatter(number: GameMoney))
    
    lazy var images: [UIImage] = {
        return (1...4).compactMap{UIImage(named: "slot-symbol\($0)")}
    }()
  
//MARK: - ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.sendSubviewToBack(Background)
        Picker.isUserInteractionEnabled = false
        Picker.reloadAllComponents()
        
        Money.text = "GameMoney: " + numberFormatter(number: GameMoney)

    }
    
//MARK: - 메서드
    @IBAction func PlayButton(_ sender: Any) {
        
        if ButtonState == false {
            ButtonState = true
            StartBtn.setImage(UIImage(named: "slot-machine3"), for: .normal)
            print("o")
        }else{
            ButtonState = false
            StartBtn.setImage(UIImage(named: "slot-machine2.png"), for: .normal)
            print("x")
        }

        trigger()
        GameMoney -= 1000
        Money.text = "GameMoney: " + numberFormatter(number: GameMoney)

        print(GameMoney)
        print(numberFormatter(number: GameMoney))
        
        self.reset = true
        PlayTime()
    }
    
    @IBAction func RestartBtn(_ sender: Any) {
        let index1 = 0
        let index2 = 0
        let index3 = 0
        self.Picker.selectRow(index1, inComponent: 0, animated: true)
        self.Picker.selectRow(index2, inComponent: 1, animated: true)
        self.Picker.selectRow(index3, inComponent: 2, animated: true)
        self.reset = false
        self.PlayTimes.text = "00:00"
    }
    
    @IBAction func resetAll(_ sender: Any) {
        self.GameMoney = 50000
        Money.text = "GameMoney: " + numberFormatter(number: GameMoney)
        self.reset = false
        self.PlayTimes.text = "00:00"
    }
    
    
    func trigger() {
        let timer = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector:#selector(scrollRandom), userInfo: nil, repeats: true)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Double((1.5)*Double(NSEC_PER_SEC)))/Double(NSEC_PER_SEC)){
            timer.invalidate()
        }
        
    }
    
    @objc func scrollRandom(){
        
        let index1 = Int.random(in: 0..<100)
        let index2 = Int.random(in: 0..<100)
        let index3 = Int.random(in: 0..<100)
        self.Picker.selectRow(index1, inComponent: 0, animated: true)
        self.Picker.selectRow(index2, inComponent: 1, animated: true)
        self.Picker.selectRow(index3, inComponent: 2, animated: true)
        

    }
    
    func PlayTime(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) {
            self.time += 1
            let sec = self.time % 60
            let min = self.time / 60
            if self.reset == false {
                self.time = 0
                return
            }
            else{
                self.PlayTimes.text = NSString(format: "%02d:%02d",min,sec) as String
                self.PlayTime()
            }
            /* 현재 시각
             let date = NSDate()
            let formatter = DateFormatter()
            formatter.dateFormat = "mm:ss"
            self.PlayTimes.text = "PlayTime:  \(formatter.string(from: date as Date))"
            */
        }
    }
    
    func numberFormatter(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let result = numberFormatter.string(from: NSNumber(value: number))!
        
        return result
    }
    
    
    
//MARK: - Extension 확장 부
}

extension PickerViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 100
    }
    
}

extension PickerViewController: UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let imageView = view as? UIImageView{
            imageView.image = images[row % images.count]
            return imageView
        }
        
        let imageView = UIImageView()
        imageView.image = images[row % images.count]
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 90
    }
    
    override func viewDidLayoutSubviews() {
        Picker.subviews[1].isHidden = true
    }
}




//MARK: - 실패 코드 들

/*import UIKit

class ViewController: UIViewController {
    
    lazy var images: [UIImage] = {
        return (1...4).compactMap{UIImage(named: "slot-symbol\($0)")}
    }()
    
    @IBOutlet weak var StartBtn: UIButton!
    @IBOutlet weak var Restart: UIButton!
    @IBOutlet weak var Picker1: UIPickerView!
    
    var StartState : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Restart.layer.cornerRadius = 45
        Picker1.isUserInteractionEnabled = false
        Picker1.reloadAllComponents()
        
    }
    
    @IBAction func StartBtnClick(_ sender: Any?) {
        if StartState == true {
            StartState = false
            StartBtn.setImage(UIImage(named: "slot-machine2"), for: .normal)
            print("o")
        }else{
            StartState = true
            StartBtn.setImage(UIImage(named: "slot-machine3"), for: .normal)
            print("x")
        }
        
        let firstIndex = Int.random(in: 0..<images.count) + images.count
        let SecondIndex = Int.random(in: 0..<images.count) + images.count
        let ThirdIndex = Int.random(in: 0..<images.count) + images.count

        
        Picker1.selectRow(firstIndex, inComponent: 0, animated: true)
        Picker1.selectRow(SecondIndex, inComponent: 1, animated: true)
        Picker1.selectRow(ThirdIndex, inComponent: 2, animated: true)

    }
    
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.count * 3
    }
    
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        if let imageView = view as? UIImageView {
            imageView.image = images[row % images.count]
            return imageView
        }
        let imageView = UIImageView()
        imageView.image = images[row % images.count]
        imageView.contentMode = .scaleAspectFit
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
}*/

/*
 import UIKit

 class PickerViewController: UIViewController {
     let sampleX = ["A","B","C","D","E","F","G","H"]
     let sampleY = ["1","2","3","4","5","6","7","8"]
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
     }
 }

 extension PickerViewController: UIPickerViewDataSource{
     func numberOfComponents(in pickerView: UIPickerView) -> Int {
         return 2
     }
     
     func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return sampleX.count
     }
 }

 extension PickerViewController: UIPickerViewDelegate{
     func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
         return sampleX[row]
     }
 }



 */


