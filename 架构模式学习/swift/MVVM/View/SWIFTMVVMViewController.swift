//
//  SWIFTMVVMViewController.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTMVVMViewController: UIViewController, SWIFTMVVMViewModelObserver {

    weak var promptLabel: UILabel!
    var detailView:SWIFTMVVMView!
    var attackButton:UIButton!
    var viewModel:SWIFTMVVMViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.initView();
        self.initViewModel();
    }
    
    private func initViewModel() {
       viewModel = SWIFTMVVMViewModel(trget: self);
    }
    
    private func initView() {
        
        detailView = SWIFTMVVMView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3.0, height: 150));
        detailView.backgroundColor = UIColor.lightGray;
        detailView.center = self.view.center;
        self.view.addSubview(detailView);
        
        let promptLabel = UILabel(frame: CGRect(x: 30, y: detailView.frame.origin.y - 50, width: self.view.frame.size.width - 60, height: 20));
        promptLabel.backgroundColor = UIColor.clear;
        promptLabel.textAlignment = NSTextAlignment.center;
        promptLabel.numberOfLines = 0;
        promptLabel.isHidden = true;
        self.promptLabel = promptLabel;
        self.view.addSubview(promptLabel);
        
        attackButton = UIButton(type: UIButton.ButtonType.custom);
        attackButton.frame = CGRect(x: ( self.view.frame.size.width - 120 ) / 2.0, y: detailView.frame.maxY + 30, width: 120, height: 35);
        
        attackButton.setTitleColor(UIColor.white, for: UIControl.State.normal);
        attackButton.backgroundColor = UIColor.red;
        attackButton.addTarget(self, action: #selector(SWIFTMVVMViewController.attackButtonAction), for: UIControl.Event.touchUpInside);
        self.view.addSubview(attackButton);
    }
    
    @objc private func attackButtonAction(sender: UIButton) {
        
        viewModel.attackAnimal();
    }
    
    // observer method
    func animalModelChange(animal: SWIFTMVVMAnimal) {
        if animal.bloodVolume == 0 {
            
            attackButton.isEnabled = false;
            attackButton.backgroundColor = UIColor.lightGray;
        }
        attackButton.setTitle("攻击\(animal.name ?? "")", for: UIControl.State.normal);
        detailView.nameLabel.text = animal.name;
        detailView.bloodVolumeLabel.text = "血量：\(animal.bloodVolume)";
        detailView.defensesLabel.text = "防御：\(animal.defenses)";
        detailView.aggressivityLabel.text = "攻击：\(animal.aggressivity)";
    }
    
    func showPromptText(text: String, isError: Bool) {
        
        promptLabel.textColor = isError ? UIColor.red : UIColor.green;
        promptLabel.text = text;
        promptLabel.isHidden = false;
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
            self.promptLabel.isHidden = true;
        }
    }

}
