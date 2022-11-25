//
//  HospitalRequest.swift
//  AnimalHos
//
//  Created by 유원근 on 2022/11/18.
//

import Foundation
import Alamofire

class HospitalRequest{
    func getHospitalData(_ viewController: HospitalcollectionVc) {
        let url = "http://openapi.seoul.go.kr:8088/\(Storage().API_KEY)/json/LOCALDATA_020301/1/16"
            

        AF.request(url,
                   method: .get,
                   parameters: nil,
                   headers: nil)
        .responseDecodable(of:HospitalResponse.self) { response in
            
            switch response.result {
            case .success(let response):
          
                print("DEBUG>> response \(response)")
                print("HEY: ", response.localdata020301.row.count)
                viewController.didSuccess(response)
                
            case .failure(let error):
                print("DEBUFG>> Error : \(error.localizedDescription)")
            }
        }
        
    }
}

