//
//  SWIFTVIPERRouter.swift
//  架构模式学习
//
//  Created by mo2323 on 2018/11/19.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

import UIKit

class SWIFTVIPERRouter: NSObject {
    
    @objc class func setRootViewControllerTo(window:UIWindow) {
        
        window.rootViewController = self.connectViperModule();
    }
    
    @objc class func pushFrom(controller:UIViewController) {
        
        controller.navigationController?.pushViewController(self.connectViperModule(), animated: true);
    }
    
    private class func connectViperModule() -> SWIFTVIPERViewController {
        
        let viewController = SWIFTVIPERViewController();
        let interactor = SWIFTVIPERInteractor();
        let presenter = SWIFTVIPERPresenter();
        presenter.interactor = interactor;
        viewController.eventHandler = presenter;
        interactor.output = presenter;
        return viewController;
    }
}
