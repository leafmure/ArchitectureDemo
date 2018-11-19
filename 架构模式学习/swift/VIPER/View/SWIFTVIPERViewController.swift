//
//  SWIFTVIPERViewController.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTVIPERViewController: UIViewController {

    var eventHandler: SWIFTVIPERViewEventHandler!
    var mainView: SWIFTVIPERView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white;
        self.initView();
        eventHandler.viewDidLoadLifeMethod();
    }
    
    private func initView() {
        
        mainView = SWIFTVIPERView(frame: self.view.bounds);
        mainView.attackButton.addTarget(self, action: #selector(SWIFTVIPERViewController.attackButtonAction), for: UIControl.Event.touchUpInside);
        self.view.addSubview(mainView);
        eventHandler.viperViewIsAlready(view: mainView);
    }
    
    @objc private func attackButtonAction(sender: UIButton) {
        
        eventHandler.attackAnimalButtonAction();
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
