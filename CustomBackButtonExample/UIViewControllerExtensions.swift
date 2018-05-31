//
//  UIViewControllerExtensions.swift
//  CustomBackButtonExample
//
//  Created by Sung Hyun on 2018. 5. 31..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

extension UIViewController {
    /*
     * 스토리보드 이름과 뷰컨트롤러 이름으로 해당 뷰컨트롤러를 리턴받는 함수.
     * @param sbName,vcName
     * @Usage self.returnVC(sbName:sName,vcName:vName)
     * @returns UIViewController
     */
    func returnVC(sbName : String, vcName : String) -> UIViewController{
        let storyboard = UIStoryboard(name: sbName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: vcName)
    }
    
    /**
     * Viewcontroller를 받아 네비게이션바로 푸시하기
     * @param UIViewController
     * Usage self.push(vc)
     */
    func push(vc : UIViewController){
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
