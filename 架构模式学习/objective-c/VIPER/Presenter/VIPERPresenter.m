//
//  VIPERPresenter.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/13.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "VIPERPresenter.h"
#import "VIPERView.h"

@implementation VIPERPresenter

- (void)attackAnimalButtonAction
{
    [self.animalDataProvider provideAnimal];
}

- (void)receiverAnimalData:(VIPERAnimal *)animal
{
    [self.view setAnimalDetail:animal];
}

@end
