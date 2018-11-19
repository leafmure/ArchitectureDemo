//
//  SWIFTMVPViewController.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTMVPViewController: UIViewController {

    weak var promptLabel: UILabel!
    var mainView: SWIFTMVPView!
    var dog: SWIFTMVPAnimal!
    var presenter: SWIFTMVPPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initModel();
        self.initView();
        self.initPresenter();
    }
    
    private func initView() {
        
        mainView = SWIFTMVPView(frame: self.view.bounds);
        mainView.attackButton.addTarget(self, action: #selector(SWIFTMVPViewController.attackButtonAction), for: UIControl.Event.touchUpInside);
        self.view.addSubview(mainView);
    }
    
    private func initModel() {
        
        dog = SWIFTMVPAnimal();
        dog.name = "蠢狗";
        dog.bloodVolume = 50.00;
        dog.aggressivity = 0.00;
        dog.defenses = 5.00;
    }
    
    private func initPresenter() {
        presenter = SWIFTMVPPresenter(view: mainView, animal: dog);
    }
    
    @objc private func attackButtonAction(sender: UIButton) {
        
        presenter.attackAnimal();
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
