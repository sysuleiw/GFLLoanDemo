//
//  GFLoanMiddleContent.m
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/15.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import "GFLLoanMiddleContent.h"
#import <FlexBoxLayout/FlexBoxLayout.h>

@implementation GFLLoanMiddleContent

- (void)layoutSubviews
{
    NSArray *imgs = @[@"loan_fast", @"loan_much", @"loan_res"];
    NSArray *names = @[@"马上贷款",@"贷款材料",@"额度测算"];
    NSMutableArray<UIButton *> *btnAry = [[NSMutableArray alloc] initWithCapacity:3];
    [imgs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton * btn = [self createLoanButton];
        [btn fb_makeLayout:^(FBLayout *layout) {
            layout.width = 100;
            layout.height = 75;
        }];
        [btn setTitle:names[idx] forState:UIControlStateNormal];
        UIImage *img = [UIImage imageNamed:obj];
        if (img)
        {
            [btn setImage:img forState:UIControlStateNormal];
            [btnAry addObject:btn];
            [self addSubview:btn];
        }
        
    }];
    FBLayoutDiv *layoutDiv = [FBLayoutDiv layoutDivWithFlexDirection:FBFlexDirectionRow
                                                      justifyContent:FBJustifySpaceAround
                                                          alignItems:FBAlignCenter
                                                            children:btnAry];
    [layoutDiv fb_applyLayouWithSize:self.bounds.size];
}

- (UIButton *)createLoanButton
{
    UIButton *btn = [UIButton new];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    return btn;
}
@end
