//
//  SWIFTVIPERPresenter.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTVIPERPresenter: NSObject,SWIFTVIPERDataOutput,SWIFTVIPERViewEventHandler {
    
    var interactor: SWIFTVIPERDataProvider!
    var view: SWIFTVIPERView!
    
    func attackAnimalButtonAction() {
        
        interactor.attackAnimal();
    }
    
    func viewDidLoadLifeMethod() {
        
        interactor.provideAnimal();
    }
    
    func viperViewIsAlready(view: SWIFTVIPERView) {
        
        self.view = view;
    }
    
    func receiverAnimalData(animal: SWIFTVIPERAnimal) {
        
        view.setAnimal(animal: animal);
    }
    
    func receiverPromptText(text: String, isError: Bool) {
        
        view.promptLabel.textColor = isError ? UIColor.red : UIColor.green;
        view.promptLabel.text = text;
        view.promptLabel.isHidden = false;
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
            
            self.view.promptLabel.isHidden = true;
        }
    }
    
}
