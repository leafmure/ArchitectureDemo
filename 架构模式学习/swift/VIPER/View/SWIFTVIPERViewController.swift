//
//  SWIFTVIPERViewController.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

protocol SWIFTVIPERViewEventHandler: class {
    
    func attackAnimalButtonAction();
    func viperViewIsAlready(view:SWIFTVIPERView);
    func viewDidLoadLifeMethod();
}

class SWIFTVIPERViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
