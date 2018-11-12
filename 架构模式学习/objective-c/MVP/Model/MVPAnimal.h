//
//  MVCAnimal.h
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MVPAnimal : NSObject

/** @brief 名称 */
@property (nonatomic,copy) NSString *name;

/** @brief 防御力 */
@property (nonatomic,assign) float defenses;

/** @brief 攻击力 */
@property (nonatomic,assign) float aggressivity;

/** @brief 血量 */
@property (nonatomic,assign) float bloodVolume;

@end

