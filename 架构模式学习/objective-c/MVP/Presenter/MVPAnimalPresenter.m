//
//  MVPAnimalPresenter.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "MVPAnimalPresenter.h"
#import "MVPAnimal.h"
#import "MVPView.h"

@interface MVPAnimalPresenter ()
/** @brief animal */
@property (nonatomic,strong) MVPAnimal *animal;
/** @brief detailView */
@property (nonatomic,strong) MVPView *view;


@end

@implementation MVPAnimalPresenter

- (instancetype)initWithView:(MVPView *)view animal:(MVPAnimal *)animal
{
    self = [super init];
    if (self) {
        
        self.view = view;
        self.animal = animal;
        [self.view.attackButton setTitle:[NSString stringWithFormat:@"攻击%@",animal.name] forState:UIControlStateNormal];
        [self updateDetail];
    }
    return self;
}

- (void)attackAnimal:(UIButton *)sender
{
    CGFloat reduceValue = random() % 15;
    CGFloat bloodReduceValue = reduceValue - _animal.defenses;
    if (bloodReduceValue <= 0) {
        
        [self showPromptText:@"无效攻击！" isError:YES];
        return;
    }
    if (_animal.bloodVolume > bloodReduceValue) {
        
        self.animal.bloodVolume = _animal.bloodVolume -bloodReduceValue;
        [self showPromptText:[NSString stringWithFormat:@"%@受到%0.2f伤害", _animal.name, bloodReduceValue] isError:NO];
    } else {
        
        self.animal.bloodVolume = 0;
        [self showPromptText:@"蠢狗死了" isError:YES];
        sender.enabled = NO;
        sender.backgroundColor = [UIColor lightGrayColor];
    }
    [self updateDetail];
}

- (void)showPromptText:(NSString *)text isError:(BOOL)isError
{
    _view.promptLabel.textColor = (isError) ? [UIColor redColor] : [UIColor greenColor];
    _view.promptLabel.text = text;
    _view.promptLabel.hidden = NO;
    __weak MVPAnimalPresenter *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        weakSelf.view.promptLabel.hidden = YES;
    });
}

- (void)updateDetail
{
    _view.nameLabel.text = _animal.name;
    _view.bloodVolumeLabel.text = [NSString stringWithFormat:@"血量：%0.2f", _animal.bloodVolume];
    _view.defensesLabel.text = [NSString stringWithFormat:@"防御：%0.2f", _animal.defenses];
    _view.aggressivityLabel.text = [NSString stringWithFormat:@"攻击：%0.2f", _animal.aggressivity];
}

@end
