//
//  VIPERPresenter.h
//  架构模式学习
//
//  Created by mo2323 on 2018/11/13.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIPERDataOutput.h"
#import "VIPERViewEventHandler.h"
#import "VIPERDataProvider.h"
@class VIPERView;

NS_ASSUME_NONNULL_BEGIN

@interface VIPERPresenter : NSObject<VIPERDataOutput,VIPERViewEventHandler>
/** @brief animalDataProvider */
@property (nonatomic,strong) NSObject<VIPERDataProvider> *interactor;

@end

NS_ASSUME_NONNULL_END
