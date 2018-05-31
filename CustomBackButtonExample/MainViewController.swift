//
//  ViewController.swift
//  CustomBackButtonExample
//
//  Created by Sung Hyun on 2018. 5. 31..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        guard let ad = UIApplication.shared.delegate as? AppDelegate else { return }
        ad.detailPageNum = 0
        
        self.title = "Main"
        
    }
    
    @IBAction func nextAction(_ sender: Any) {
        guard let detailVC = self.returnVC(sbName: "Main", vcName: "DetailViewController") as? DetailViewController else { return }
        self.push(vc: detailVC)
    }
}
