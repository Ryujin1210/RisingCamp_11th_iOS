//
//  LoginViewController.swift
//  AnimalHos
//
//  Created by 유원근 on 2022/11/19.
//

import Foundation
import UIKit
import KakaoSDKAuth
import KakaoSDKUser
import KakaoSDKCommon



class LoginViewController : UIViewController {
    
    @IBOutlet weak var NickNameLabel: UILabel!
    @IBOutlet weak var EmailLabel: UILabel!
    
    @IBOutlet weak var KakaoLogin: UIButton!
    @IBOutlet weak var LogoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  
    
    func setUserInfo() {
            UserApi.shared.me {(user, error) in
                if let error = error {
                    print(error)
                } else {
                    print("nickname: \(user?.kakaoAccount?.profile?.nickname ?? "닉네임 없음")")
                    print("email: \(user?.kakaoAccount?.email ?? "이메일 없음")")
                    
                    guard let userId = user?.id else {return}
                    
                    print("닉네임 : \(user?.kakaoAccount?.profile?.nickname ?? "닉네임 없음").....이메일 : \(user?.kakaoAccount?.email ?? "이메일 없음"). . . . .유저 ID : \(userId)")
                    self.NickNameLabel.text = "Nickname : \(user?.kakaoAccount?.profile?.nickname ?? "닉네임 없음")"
                    self.EmailLabel.text = "Email : \(user?.kakaoAccount?.email ?? "이메일 없음")"
                }
            }
        }
    
    func resetUserInfo() {
        self.NickNameLabel.text = "로그아웃에 성공했습니다"
        self.EmailLabel.text = ""
    }
    
    @IBAction func LoginAction(_ sender: Any) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("카카오톡 앱으로 로그인 성공")
                    self.setUserInfo()
                    //do something
                    _ = oauthToken
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        print("카카오게정으로 로그인 성공")
                        self.setUserInfo()
                        
                        guard let nextVc =
                        self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationVC")
                        else {return}
                        nextVc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
                        self.present(nextVc, animated: true)
                        
                        //do something
                        _ = oauthToken
                    }
                }
        }
    }
    
    @IBAction func LogoutAction(_ sender: Any) {
        UserApi.shared.logout{(error) in
            if let error = error {
                print(error)
            } else {
                self.resetUserInfo()
                print("kakao logout success")
            }
        }
    }
    
    @IBAction func nextPage(_ sender: Any) {
        guard let nextVc =
                self.storyboard?.instantiateViewController(withIdentifier: "MainNavigationVC") else {return}
        nextVc.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(nextVc, animated: true)
    }

    
}
