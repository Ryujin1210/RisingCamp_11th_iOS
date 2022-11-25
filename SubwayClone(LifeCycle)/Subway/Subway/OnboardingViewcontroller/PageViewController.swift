//
//  PageViewController.swift
//  Subway
//
//  Created by 유원근 on 2022/10/28.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    
    //closure 변수
    //var completeHandler : ((Int)->())?
    
    //pageviewcontroller에 넣을 viewcontroller 들을 배열 형태를 가진 viewslist 함수를 설정
    lazy var viewsList : [UIViewController] = {
        return [self.vcInstance(name: "OnboardingVC1"),
                self.vcInstance(name: "OnboardingVC2"),
                self.vcInstance(name: "OnboardingVC3"),
                self.vcInstance(name: "OnboardingVC4"),
                self.vcInstance(name: "OnboardingVC5"),
                self.vcInstance(name: "OnboardingVC6")]
    }()
    
    private func vcInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }

    

        
    //datasource와 delegate를 self로 맺어주고 viewlist.first(첫번째 배열이 존재하는가?)라면
    //pagevc에 있는 self.setViewControllers([firstvc], direction: .forward, animated: true, completion: nil) 를 넣어줍니다. setViewControllers([보여질 뷰 위치 ], 방향 : 앞/뒤, animated: true, completion: nil) 이렇게 해준다.   이 때 setViewControllers가 배열인 이유는 한페이지에 여러개 보여줄수도 있기때문이다.
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        self.delegate = self
    
        
        if let firstvc = viewsList.first {
            self.setViewControllers([firstvc], direction: .forward, animated: true, completion: nil)
        }
    }
    
    
    //기본적으로 설정해줘야할 datasource함수들 before,after 뷰가 이전할 때 미리 이전 뷰와 앞의 뷰를 감지해놓는 것이다.
    // viewList에서 가장 처음에 나오는 함수 매개변수 viewController의 위치를 반환해줍니다. 만약에 없다면 nil!
    //그래서 before 면 index가 0 보다 커야하고 after면 viewList.count 보다 크거나 같으면 안돼니깐 저렇게 해주고 viewList[다음 위치]를 반환해줍니다!
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewsList.firstIndex(of: viewController) else {return nil}
        
        let previoustIndex = index - 1
        
        if (previoustIndex < 0) {
            return nil
        }else{
            return viewsList[previoustIndex]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = viewsList.firstIndex(of: viewController) else {return nil}
        
        let nextIndex = index + 1
        
        if (nextIndex >= viewsList.count) {
            return nil
        }else{
            return viewsList[nextIndex]
        }
        
    }
    

    
    
}
