//
//  VIPERInteractor.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/13.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "VIPERInteractor.h"
#import "VIPERAnimal.h"

@implementation VIPERInteractor

- (void)provideAnimal
{
    VIPERAnimal *dog = [[VIPERAnimal alloc] init];
    dog.name = @"蠢狗";
    dog.bloodVolume = 50;
    dog.aggressivity = 0;
    dog.defenses = 5;
    
    [_output receiverAnimalData:dog];
}

@end
