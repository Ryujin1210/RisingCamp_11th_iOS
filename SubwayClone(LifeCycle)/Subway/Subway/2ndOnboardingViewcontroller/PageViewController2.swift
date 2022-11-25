//
//  PageViewController2.swift
//  Subway
//
//  Created by 유원근 on 2022/10/29.
//

import UIKit

class PageViewController2: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    lazy var viewsList2 : [UIViewController] = {
        return [self.vcInstance(name: "SndOnboardingVC1"),
                self.vcInstance(name: "SndOnboardingVC2"),
                self.vcInstance(name: "SndOnboardingVC3")]
    }()
    
    private func vcInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
    
        
        if let firstvc = viewsList2.first {
            self.setViewControllers([firstvc], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    //기본적으로 설정해줘야할 datasource함수들 before,after 뷰가 이전할 때 미리 이전 뷰와 앞의 뷰를 감지해놓는 것이다.
    // viewList에서 가장 처음에 나오는 함수 매개변수 viewController의 위치를 반환해줍니다. 만약에 없다면 nil!
    //그래서 before 면 index가 0 보다 커야하고 after면 viewList.count 보다 크거나 같으면 안돼니깐 저렇게 해주고 viewList[다음 위치]를 반환해줍니다!
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewsList2.firstIndex(of: viewController) else {return nil}
        
        let previoustIndex = index - 1
        
        if (previoustIndex < 0) {
            return nil
        }else{
            return viewsList2[previoustIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewsList2.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = index + 1
        
        if (nextIndex >= viewsList2.count) {
            return nil
        }else{
            return viewsList2[nextIndex]
        }
        
    }
    
}
