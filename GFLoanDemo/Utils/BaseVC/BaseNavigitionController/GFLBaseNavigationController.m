//
//  GFLBaseNavigationController.m
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/13.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import "GFLBaseNavigationController.h"

@interface GFLBaseNavigationController ()

@end

@implementation GFLBaseNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBarTintColor:GFL_DEFAULT_NAVBAR_COLOR];
    [self.navigationBar setTintColor:[UIColor whiteColor]];
    [self.view setBackgroundColor:GFL_DEFAULT_BACKGROUND_COLOR];
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
