//
//  MVPAnimalPresenter.h
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MVVMAnimal;

@protocol MVVMAnimalViewModelObserver <NSObject>

@required
- (void)animalModelChange:(MVVMAnimal *)animal;

- (void)showPromptText:(NSString *)text isError:(BOOL)isError;

@end

@interface MVVMAnimalViewModel : NSObject
/** @brief observer */
@property (nonatomic,weak) id<MVVMAnimalViewModelObserver> observer;

- (instancetype)initWithTarget:(id)target;

- (void)attackAnimal;

@end

