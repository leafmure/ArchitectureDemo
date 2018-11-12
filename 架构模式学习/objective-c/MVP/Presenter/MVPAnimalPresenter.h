//
//  MVPAnimalPresenter.h
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MVPAnimal;
@class MVPView;

@interface MVPAnimalPresenter : NSObject

- (instancetype)initWithView:(MVPView *)detailView animal:(MVPAnimal *)animal;

- (void)attackAnimal:(UIButton *)sender;

@end

