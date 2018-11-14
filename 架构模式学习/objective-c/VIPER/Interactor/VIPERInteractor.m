//
//  VIPERInteractor.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/13.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "VIPERInteractor.h"
#import "VIPERAnimal.h"

@interface VIPERInteractor ()
/** @brief dog */
@property (nonatomic,strong) VIPERAnimal *dog;

@end

@implementation VIPERInteractor

- (void)provideAnimal
{
    _dog = [[VIPERAnimal alloc] init];
    _dog.name = @"蠢狗";
    _dog.bloodVolume = 50;
    _dog.aggressivity = 0;
    _dog.defenses = 5;
    [_output receiverAnimalData:_dog];
}

- (void)attackAnimal
{
    float reduceValue = random() % 15;
    float bloodReduceValue = reduceValue - _dog.defenses;
    if (bloodReduceValue <= 0) {
        
        [_output receiverPromptText:@"无效攻击！" isError:YES];
        return;
    }
    if (_dog.bloodVolume > bloodReduceValue) {
        
        self.dog.bloodVolume = _dog.bloodVolume -bloodReduceValue;
        [_output receiverPromptText:[NSString stringWithFormat:@"%@受到%0.2f伤害", _dog.name, bloodReduceValue] isError:NO];
    } else {
        
        self.dog.bloodVolume = 0;
        [_output receiverPromptText:@"蠢狗死了" isError:YES];
    }
    [_output receiverAnimalData:_dog];
}

@end
