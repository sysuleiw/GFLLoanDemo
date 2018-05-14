//
//  GFLLoanNewsViewModel.h
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/13.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GFLLoanNewsModel.h"

@interface GFLLoanNewsViewModel : NSObject
@property (nonatomic, strong, readonly) GFLLoanNewsModel *newsModel;//for kvo

@property (nonatomic, strong, readonly) NSArray<NSString *> *loanNewsImgUrl;//资讯图片url
@property (nonatomic, strong, readonly) NSArray<NSString *> *loanNewsTitle;//资讯新闻标题


/**
 通过viewModel获取数据
 */
- (void)fetchLoanNewsInfoList;
@end
