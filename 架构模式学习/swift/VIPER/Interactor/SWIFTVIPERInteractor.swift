//
//  SWIFTVIPERInteractor.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

protocol SWIFTVIPERDataProvider: class {
    func provideAnimal();
    func attackAnimal();
}

protocol SWIFTVIPERDataOutput: class {
    func receiverAnimalData(animal:SWIFTVIPERAnimal);
    func receiverPromptText(text:String, isError:Bool);
}

class SWIFTVIPERInteractor: NSObject,SWIFTVIPERDataProvider {

    weak var output: SWIFTVIPERDataOutput!
    private var dog: SWIFTVIPERAnimal!
    
    func provideAnimal() {
        
        dog = SWIFTVIPERAnimal();
        dog.name = "蠢狗";
        dog.bloodVolume = 50.00;
        dog.aggressivity = 0.00;
        dog.defenses = 5.00;
        output.receiverAnimalData(animal: dog);
    }
    
    func attackAnimal() {
        
        let reduceValue:Float = Float(arc4random() % 15);
        let bloodReduceValue = reduceValue - dog.defenses;
        if bloodReduceValue <= 0 {
            
            output.receiverPromptText(text: "无效攻击！", isError: true)
            return;
        }
        if dog.bloodVolume > bloodReduceValue {
            
            dog.bloodVolume = dog.bloodVolume - bloodReduceValue;
            output.receiverPromptText(text: (dog.name! + "受到\(bloodReduceValue)伤害"), isError: false);
        } else {
            
            dog.bloodVolume = 0;
            output.receiverPromptText(text: "蠢狗死了", isError: true);
        }
        output.receiverAnimalData(animal: dog);
    }
}
