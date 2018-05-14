//
//  GFLLoanNewsModel.h
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/14.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>

//单条资讯广告model信息
@interface GFLLoanNewsInfo : NSObject
@property (nonatomic, copy) NSString *img_url;
@property (nonatomic, copy) NSString *title;
@end

//资讯轮播组件model
@interface GFLLoanNewsModel : NSObject
@property (nonatomic, strong) NSArray<GFLLoanNewsInfo *> *newsInfoList;
@end
