//
//  GFLLoanNewsViewModel.m
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/13.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import "GFLLoanNewsViewModel.h"
@interface GFLLoanNewsViewModel()
@property (nonatomic, strong) GFLLoanNewsModel *newsModel;//for kvo

@property (nonatomic, strong) NSArray<NSString *> *loanNewsImgUrl;//资讯图片url
@property (nonatomic, strong) NSArray<NSString *> *loanNewsTitle;//资讯新闻标题
@end

@implementation GFLLoanNewsViewModel

- (NSArray<NSString *> *)loanNewsImgUrl
{
    NSAssert(self.newsModel.newsInfoList.count, @"资讯数据为空，请检查接口");
    NSMutableArray *imgUrls = [[NSMutableArray alloc] initWithCapacity:self.newsModel.newsInfoList.count];
    [self.newsModel.newsInfoList enumerateObjectsUsingBlock:^(GFLLoanNewsInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [imgUrls addObject:obj.img_url];
    }];
    return [imgUrls copy];
}

- (NSArray<NSString *> *)loanNewsTitle
{
    NSAssert(self.newsModel.newsInfoList.count, @"资讯数据为空，请检查接口");
    NSMutableArray *titles = [[NSMutableArray alloc] initWithCapacity:self.newsModel.newsInfoList.count];
    [self.newsModel.newsInfoList enumerateObjectsUsingBlock:^(GFLLoanNewsInfo * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [titles addObject:obj.title];
    }];
    return [titles copy];
}

#pragma mark - Public
- (void)fetchLoanNewsInfoList
{
    //网络请求到实际数据
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *jsonData =@{@"newsInfoList":@[
                                   @{@"img_url":@"http://cms-bucket.nosdn.127.net/d313cba133d5437b81023ca53ae12b0a20180513090748.jpeg",
                                     @"title":@"聚焦2018网易经济学家年会·哀牢山论坛"},
                                   @{@"img_url":@"http://cms-bucket.nosdn.127.net/a9f6d98f30594852ae57567331c1b87420180512160737.jpeg",
                                     @"title":@"汶川特大地震灾后恢复重建发展纪实"},
                                   @{@"img_url":@"http://cms-bucket.nosdn.127.net/10d55c175d2d4c8380854e77c937519b20180512133101.jpeg",
                                     @"title":@"十年蝶变的汶川：只为那些期待眼神"}
                                   ]};
        self.newsModel = [GFLLoanNewsModel yy_modelWithJSON:jsonData];
    });
}
@end
