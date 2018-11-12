//
//  MVCAnimalDetailView.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "MVPView.h"
#import "MVPAnimal.h"

@implementation MVPView

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
    UIView *detailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 3, 150)];
    detailView.backgroundColor = [UIColor lightGrayColor];
    detailView.center = self.center;
    [self addSubview:detailView];
    
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, detailView.frame.size.width, 20)];
    _nameLabel.textColor = [UIColor redColor];
    _nameLabel.textAlignment = NSTextAlignmentCenter;
    [detailView addSubview: _nameLabel];
    
    _bloodVolumeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_nameLabel.frame) + 10, detailView.frame.size.width - 10, 20)];
    _bloodVolumeLabel.textColor = [UIColor redColor];
    [detailView addSubview: _bloodVolumeLabel];
    
    _aggressivityLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_bloodVolumeLabel.frame) + 10, detailView.frame.size.width - 10, 20)];
    _aggressivityLabel.textColor = [UIColor yellowColor];
    [detailView addSubview: _aggressivityLabel];
    
    _defensesLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(_aggressivityLabel.frame) + 10, detailView.frame.size.width - 10, 20)];
    _defensesLabel.textColor = [UIColor redColor];
    [detailView addSubview: _defensesLabel];
    
    _promptLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, detailView.frame.origin.y - 50, self.frame.size.width - 60, 20)];
    _promptLabel.backgroundColor = [UIColor clearColor];
    _promptLabel.textAlignment = NSTextAlignmentCenter;
    _promptLabel.numberOfLines = 0;
    _promptLabel.hidden = YES;
    [self addSubview:_promptLabel];
    
    _attackButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _attackButton.frame = CGRectMake(( self.frame.size.width - 120 ) / 2.f, CGRectGetMaxY(detailView.frame) + 30, 120, 35);
    [_attackButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_attackButton setBackgroundColor:[UIColor redColor]];
    [self addSubview:_attackButton];
}


@end
