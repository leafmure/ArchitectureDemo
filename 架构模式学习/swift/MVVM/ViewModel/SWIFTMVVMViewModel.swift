//
//  SWIFTMVVMViewModel.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

protocol SWIFTMVVMViewModelObserver: class {
    
    func animalModelChange(animal: SWIFTMVVMAnimal);
    func showPromptText(text: String, isError: Bool);
}

class SWIFTMVVMViewModel: NSObject {
    
    private var dog: SWIFTMVVMAnimal?
    weak var observer: SWIFTMVVMViewModelObserver!
    
    init(trget: Any) {
        super.init()
        observer = trget as? SWIFTMVVMViewModelObserver;
        self.initModel();
    }
    
    private func initModel() {
        
        dog = SWIFTMVVMAnimal();
        dog?.name = "蠢狗";
        dog?.bloodVolume = 50.00;
        dog?.aggressivity = 0.00;
        dog?.defenses = 5.00;
        observer.animalModelChange(animal: dog!)
    }
    
    func attackAnimal() {
        
        if let dogAnimal = dog {
            
            let reduceValue:Float = Float(arc4random() % 15);
            let bloodReduceValue = reduceValue - dogAnimal.defenses;
            if bloodReduceValue <= 0 {
                
                observer.showPromptText(text: "无效攻击！", isError: true)
                return;
            }
            if dogAnimal.bloodVolume > bloodReduceValue {
                
                dogAnimal.bloodVolume = dogAnimal.bloodVolume - bloodReduceValue;
                observer.showPromptText(text: (dogAnimal.name! + "受到\(bloodReduceValue)伤害"), isError: false);
            } else {
                
                dogAnimal.bloodVolume = 0;
                observer.showPromptText(text: "蠢狗死了", isError: true);
            }
            observer.animalModelChange(animal: dogAnimal)
        }
    }
}
