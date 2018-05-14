//
//  GFLRootViewController.m
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/13.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import "GFLRootViewController.h"
#import "GFLLoanViewController.h"
#import "GFLRefundViewController.h"
#import "GFLFinanceViewController.h"
#import "GFLMineViewController.h"
#import "GFLBaseNavigationController.h"

@interface GFLRootViewController ()

@property (nonatomic, strong) GFLLoanViewController    *loanVC; //借款
@property (nonatomic, strong) GFLRefundViewController  *refundVC;//还款
@property (nonatomic, strong) GFLFinanceViewController *financeVC;//理财
@property (nonatomic, strong) GFLMineViewController    *mineVC;//个人中心
@end

@implementation GFLRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.tabBar setBackgroundColor:GFL_DEFAULT_SEARCHBAR_COLOR];
    [self.tabBar setTintColor:GFL_DEFAULT_GREEN_COLOR];
    
    
    GFLBaseNavigationController *loanNavC = [[GFLBaseNavigationController alloc] initWithRootViewController:self.loanVC];
    GFLBaseNavigationController *refundNavC = [[GFLBaseNavigationController alloc] initWithRootViewController:self.refundVC];
    GFLBaseNavigationController *financeNavC = [[GFLBaseNavigationController alloc] initWithRootViewController:self.financeVC];
    GFLBaseNavigationController *mineNavC = [[GFLBaseNavigationController alloc] initWithRootViewController:self.mineVC];
    [self setViewControllers:@[loanNavC, refundNavC, financeNavC, mineNavC]];
}

#pragma mark - Getters & Setters
- (GFLLoanViewController *)loanVC
{
    if (!_loanVC)
    {
        _loanVC = [GFLLoanViewController new];
        _loanVC.tabBarItem.title = @"借款";
        [_loanVC.tabBarItem setImage:[UIImage imageNamed:@"loan"]];
        [_loanVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"loan_s"]];
    }
    return _loanVC;
}
- (GFLRefundViewController *)refundVC
{
    if (!_refundVC)
    {
        _refundVC = [GFLRefundViewController new];
        _refundVC.tabBarItem.title = @"还款";
        [_refundVC.tabBarItem setImage:[UIImage imageNamed:@"refund"]];
        [_refundVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"refund_s"]];
    }
    return _refundVC;
}

- (GFLFinanceViewController *)financeVC
{
    if (!_financeVC)
    {
        _financeVC = [GFLFinanceViewController new];
        _financeVC.tabBarItem.title = @"理财";
        [_financeVC.tabBarItem setImage:[UIImage imageNamed:@"finance"]];
        [_financeVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"finance_s"]];
    }
    return _financeVC;
}

- (GFLMineViewController *)mineVC
{
    if (!_mineVC)
    {
        _mineVC = [GFLMineViewController new];
        _mineVC.tabBarItem.title = @"个人中心";
        [_mineVC.tabBarItem setImage:[UIImage imageNamed:@"mine"]];
        [_mineVC.tabBarItem setSelectedImage:[UIImage imageNamed:@"mine_s"]];
    }
    return _mineVC;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
