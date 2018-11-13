//
//  VIPERInteractor.h
//  架构模式学习
//
//  Created by mo2323 on 2018/11/13.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIPERDataProvider.h"
#import "VIPERDataOutput.h"

@interface VIPERInteractor : NSObject<VIPERDataProvider>
/** @brief output */
@property (nonatomic,weak) id<VIPERDataOutput> output;

@end


