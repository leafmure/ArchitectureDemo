//
//  VIPERPresenter.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/13.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "VIPERPresenter.h"
#import "VIPERAnimal.h"
#import "VIPERView.h"

@interface VIPERPresenter ()


@end

@implementation VIPERPresenter

- (void)attackAnimalButtonAction
{
    
    [self.interactor attackAnimal];
}

- (void)viewDidLoadLifeMethod
{
    [self.interactor provideAnimal];
}

#pragma mark - ====== output method ======
- (void)receiverAnimalData:(VIPERAnimal *)animal
{
    [self.view setAnimalDetail:animal];
}

- (void)receiverPromptText:(NSString *)text isError:(BOOL)isError
{
    _view.promptLabel.textColor = (isError) ? [UIColor redColor] : [UIColor greenColor];
    _view.promptLabel.text = text;
    _view.promptLabel.hidden = NO;
    __weak VIPERPresenter *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        weakSelf.view.promptLabel.hidden = YES;
    });
}

@end
