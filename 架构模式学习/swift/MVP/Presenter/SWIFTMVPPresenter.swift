//
//  SWIFTMVPPresenter.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTMVPPresenter: NSObject {

    private var animal:SWIFTMVPAnimal!
    private weak var view:SWIFTMVPView!
    init(view:SWIFTMVPView, animal:SWIFTMVPAnimal) {
        super.init()
        self.animal = animal;
        self.view = view;
        self.updateAnimalDetail();
    }
    
    func attackAnimal() {
       
        let reduceValue:Float = Float(arc4random() % 15);
        let bloodReduceValue = reduceValue - animal.defenses;
        if bloodReduceValue <= 0 {
                
            self.showPromptText(text: "无效攻击！", isError: true)
            return;
        }
        if animal.bloodVolume > bloodReduceValue {
                
            animal.bloodVolume = animal.bloodVolume - bloodReduceValue;
            view.bloodVolumeLabel.text = "血量：\(animal.bloodVolume)";
            self.showPromptText(text: (animal.name! + "受到\(bloodReduceValue)伤害"), isError: false);
        } else {
                
            animal.bloodVolume = 0;
            view.bloodVolumeLabel.text = "血量：\(animal.bloodVolume)";
            self.showPromptText(text: "蠢狗死了", isError: true);
            view.attackButton.isEnabled = false;
            view.attackButton.backgroundColor = UIColor.lightGray;
        }
        self.updateAnimalDetail();
    }
    
    private func updateAnimalDetail() {
        
        view.attackButton.setTitle("攻击\(animal.name ?? "")", for: UIControl.State.normal);
        view.nameLabel.text = animal.name;
        view.bloodVolumeLabel.text = "血量：\(animal.bloodVolume)";
        view.defensesLabel.text = "防御：\(animal.defenses)";
        view.aggressivityLabel.text = "攻击：\(animal.aggressivity)";
    }
    
    private func showPromptText(text: String, isError: Bool) {
        
        view.promptLabel.textColor = isError ? UIColor.red : UIColor.green;
        view.promptLabel.text = text;
        view.promptLabel.isHidden = false;
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
            self.view.promptLabel.isHidden = true;
        }
    }
}
