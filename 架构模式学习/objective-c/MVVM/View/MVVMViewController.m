//
//  MVCViewController.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "MVVMViewController.h"
#import "MVVMAnimal.h"
#import "MVVMView.h"
#import "MVVMAnimalViewModel.h"

@interface MVVMViewController ()<MVVMAnimalViewModelObserver>
/** @brief view */
@property (nonatomic,strong) MVVMView *mainView;
/** @brief presenter */
@property (nonatomic,strong) MVVMAnimalViewModel *viewModel;


@end

@implementation MVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    [self initViewModel];
}

- (void)initView
{
    _mainView = [[MVVMView alloc] initWithFrame:self.view.bounds];
    [_mainView.attackButton addTarget:self action:@selector(attackButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_mainView];
}

- (void)initViewModel
{
    _viewModel = [[MVVMAnimalViewModel alloc] initWithTarget:self];
}

- (void)attackButtonAction:(UIButton *)sender
{
    [_viewModel attackAnimal];
}

#pragma mark - ====== viewModel observer ======
- (void)animalModelChange:(MVVMAnimal *)animal
{
    _mainView.nameLabel.text = animal.name;
    _mainView.bloodVolumeLabel.text = [NSString stringWithFormat:@"血量：%0.2f", animal.bloodVolume];
    _mainView.defensesLabel.text = [NSString stringWithFormat:@"防御：%0.2f", animal.defenses];
    _mainView.aggressivityLabel.text = [NSString stringWithFormat:@"攻击：%0.2f", animal.aggressivity];
    if (animal.bloodVolume == 0) {
        
        _mainView.attackButton.enabled = NO;
        _mainView.attackButton.backgroundColor = [UIColor lightGrayColor];
    }
    [_mainView.attackButton setTitle:[NSString stringWithFormat:@"攻击%@",animal.name] forState:UIControlStateNormal];
}

- (void)showPromptText:(NSString *)text isError:(BOOL)isError
{
    _mainView.promptLabel.textColor = (isError) ? [UIColor redColor] : [UIColor greenColor];
    _mainView.promptLabel.text = text;
    _mainView.promptLabel.hidden = NO;
    __weak MVVMViewController *weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        weakSelf.mainView.promptLabel.hidden = YES;
    });
}

@end
