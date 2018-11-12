//
//  GunView.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "CocoaMVCAnimalDetailView.h"

@implementation CocoaMVCAnimalDetailView

#pragma mark - ====== init method ======
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.frame.size.width, 20)];
    _nameLabel.textColor = [UIColor redColor];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview: _nameLabel];
    
    _bloodVolumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_nameLabel.frame) + 10, self.frame.size.width - 10, 20)];
    _bloodVolumeLabel.textColor = [UIColor redColor];
    [self addSubview: _bloodVolumeLabel];
    
    _aggressivityLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_bloodVolumeLabel.frame) + 10, self.frame.size.width - 10, 20)];
    _aggressivityLabel.textColor = [UIColor yellowColor];
    [self addSubview: _aggressivityLabel];
    
    _defensesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_aggressivityLabel.frame) + 10, self.frame.size.width - 10, 20)];
    _defensesLabel.textColor = [UIColor redColor];
    [self addSubview: _defensesLabel];
}

@end
