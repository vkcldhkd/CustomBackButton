//
//  DetailViewController.swift
//  CustomBackButtonExample
//
//  Created by Sung Hyun on 2018. 5. 31..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(self.customBackButtonAction))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        guard let ad = UIApplication.shared.delegate as? AppDelegate else { return }
        self.title = "Detail \(ad.detailPageNum)"
    }

    @IBAction func nextAction(_ sender: Any) {
        guard let detailVC = self.returnVC(sbName: "Main", vcName: "DetailViewController") as? DetailViewController else { return }
        guard let ad = UIApplication.shared.delegate as? AppDelegate else { return }
        ad.detailPageNum += 1
        self.push(vc: detailVC)
    }
}

extension DetailViewController {
    @objc func customBackButtonAction(){
        let alertVC = UIAlertController.init(title: "확인", message: "정말 뒤로 가시겠습니까?", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "뒤로", style: .default, handler: { (action) in
            
            guard let ad = UIApplication.shared.delegate as? AppDelegate else { return }
            ad.detailPageNum -= 1
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }))
        
        alertVC.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        
        DispatchQueue.main.async {
            self.present(alertVC, animated: true, completion: nil)
        }
    }
}
