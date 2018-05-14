//
//  GFLLoanNewsModel.m
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/14.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import "GFLLoanNewsModel.h"

@implementation GFLLoanNewsInfo
+ (NSDictionary *)modelCustomPropertyMapper
{
    return @{@"img_url" : @[@"imgUrl",@"img_Url",@"img_url"]};
}
@end

@implementation GFLLoanNewsModel
+ (NSDictionary *)modelContainerPropertyGenericClass
{
    return @{@"newsInfoList" : [GFLLoanNewsInfo class]};
}
@end
