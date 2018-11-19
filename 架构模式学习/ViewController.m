//
//  ViewController.m
//  架构模式学习
//
//  Created by mo2323 on 2018/11/12.
//  Copyright © 2018年 com.developer.meanmouse. All rights reserved.
//

#import "ViewController.h"
#import "CocoaMVCViewController.h"
#import "MVCViewController.h"
#import "MVPViewController.h"
#import "MVVMViewController.h"
#import "VIPERRouter.h"
#import "架构模式学习-Swift.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
/** @brief titleArray */
@property (nonatomic,strong) NSArray *titleArray;
/** @brief selectedSegmentIndex */
@property (nonatomic, assign) NSInteger selectedSegmentIndex;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initSegmentControl];
    self.titleArray = @[@"苹果意愿MVC",@"一般使用的MVC",@"MVP",@"MVVM",@"VIPER"];
}

- (void)initSegmentControl
{
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"objective-c",@"swift"]];
    segmentControl.selectedSegmentIndex = 0;
    self.navigationItem.titleView = segmentControl;
    [segmentControl addTarget:self action:@selector(selectedSegmentIndexValueChange:) forControlEvents:UIControlEventValueChanged];
}

- (void)selectedSegmentIndexValueChange:(UISegmentedControl *)sender
{
    _selectedSegmentIndex = sender.selectedSegmentIndex;
}

#pragma mark - ====== tableView delegate、dataSource ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            if (_selectedSegmentIndex == 0) {
                
                CocoaMVCViewController *controller = [[CocoaMVCViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            } else {
                
                SWIFTCocoaMVCViewController *controller = [[SWIFTCocoaMVCViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            }
        }
            break;
        case 1:
        {
            if (_selectedSegmentIndex == 0) {
                
                MVCViewController *controller = [[MVCViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            } else {
                
                SWIFTMVCViewController *controller = [[SWIFTMVCViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            }
        }
            break;
        case 2:
        {
            if (_selectedSegmentIndex == 0) {
                
                MVPViewController *controller = [[MVPViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            } else {
                
                SWIFTMVPViewController *controller = [[SWIFTMVPViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            }
        }
            break;
        case 3:
        {
            if (_selectedSegmentIndex == 0) {
                
                MVVMViewController *controller = [[MVVMViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            } else {
                
                SWIFTMVVMViewController *controller = [[SWIFTMVVMViewController alloc] init];
                [self.navigationController pushViewController:controller animated:YES];
            }
        }
            break;
        case 4:
        {
            if (_selectedSegmentIndex == 0) {
                
                [VIPERRouter pushFromController:self];
            } else {
                
                [SWIFTVIPERRouter pushFromController:self];
            }
        }
            break;
            
        default:
            break;
    }
}

@end
