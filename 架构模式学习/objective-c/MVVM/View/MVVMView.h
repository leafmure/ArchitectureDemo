//
//  MVCAnimalDetailView.h
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface MVVMView : UIView

/** @brief 名称 */
@property (nonatomic,strong) UILabel *nameLabel;

/** @brief 防御力 */
@property (nonatomic,strong) UILabel *defensesLabel;

/** @brief 攻击力 */
@property (nonatomic,strong) UILabel *aggressivityLabel;

/** @brief 血量 */
@property (nonatomic,strong) UILabel *bloodVolumeLabel;

/** @brief attackButton */
@property (nonatomic,strong) UIButton *attackButton;

/** @brief promptLabel */
@property (nonatomic,strong) UILabel *promptLabel;

@end

