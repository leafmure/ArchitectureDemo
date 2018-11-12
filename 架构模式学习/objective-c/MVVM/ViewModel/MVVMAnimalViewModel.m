//
//  MVPAnimalPresenter.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "MVVMAnimalViewModel.h"
#import "MVVMAnimal.h"

@interface MVVMAnimalViewModel ()
/** @brief model */
@property (nonatomic,strong) MVVMAnimal *dog;

@end

@implementation MVVMAnimalViewModel

- (instancetype)initWithTarget:(id)target
{
    self = [super init];
    if (self) {
        
        self.observer = target;
        [self initModel];
    }
    return self;
}

- (void)initModel
{
    _dog = [[MVVMAnimal alloc] init];
    _dog.name = @"蠢狗";
    _dog.bloodVolume = 50;
    _dog.aggressivity = 0;
    _dog.defenses = 5;
    [_observer animalModelChange:_dog];
}

- (void)attackAnimal
{
    CGFloat reduceValue = random() % 15;
    CGFloat bloodReduceValue = reduceValue - _dog.defenses;
    if (bloodReduceValue <= 0) {
        
        [_observer showPromptText:@"无效攻击！" isError:YES];
        return;
    }
    if (_dog.bloodVolume > bloodReduceValue) {
        
        self.dog.bloodVolume = _dog.bloodVolume -bloodReduceValue;
        [_observer showPromptText:[NSString stringWithFormat:@"%@受到%0.2f伤害", _dog.name, bloodReduceValue] isError:NO];
    } else {
        
        self.dog.bloodVolume = 0;
        [_observer showPromptText:@"蠢狗死了" isError:YES];
    }
    
    [_observer animalModelChange:_dog];
}


@end
