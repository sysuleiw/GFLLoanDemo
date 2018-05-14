//
//  GFLLoanViewController.m
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/13.
//  Copyright © 2018年 王磊. All rights reserved.
//

#import "GFLLoanViewController.h"
#import <FlexBoxLayout/FlexBoxLayout.h>
#import "GFLLoanNewsViewModel.h"
#import <YJBannerView/YJBannerView.h>
#import <FBKVOController.h>
#import "GFLLoanMiddleContent.h"
@interface GFLLoanViewController ()<YJBannerViewDelegate, YJBannerViewDataSource>
@property (nonatomic, strong) YJBannerView         *newsBannerView;
@property (nonatomic, strong) GFLLoanNewsViewModel *newsViewModel;
@property (nonatomic, strong) UIView               *bottomLoanConetntView;
@property (nonatomic, strong) FBKVOController      *kvoBinder;
@property (nonatomic, strong) GFLLoanMiddleContent *middleContentView;
@end

@implementation GFLLoanViewController

#pragma mark - LifeCycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setUpViews];
    [self fetchNewsDataAndReload];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [self.newsBannerView invalidateTimerWhenAutoScroll];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - YJBannerViewDelegate
- (void)bannerView:(YJBannerView *)bannerView didSelectItemAtIndex:(NSInteger)index
{
    //点击资讯
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"资讯标题"
                                                    message:[NSString stringWithFormat:@"第%zd个资讯", index]
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"确定", nil];
    [alert show];
}

#pragma mark - YJBannerViewDataSource
- (NSArray *)bannerViewTitles:(YJBannerView *)bannerView
{
    NSAssert(self.newsViewModel.loanNewsTitle.count, @"新闻标题数据源为空，数据异常！");
    return self.newsViewModel.loanNewsTitle;
}

- (NSArray *)bannerViewImages:(YJBannerView *)bannerView
{
    NSAssert(self.newsViewModel.loanNewsImgUrl.count, @"新书图片数据源为空，数据异常！");
    return self.newsViewModel.loanNewsImgUrl;
}

#pragma mark - PrivateMethods
- (void)setUpViews
{
    self.view.backgroundColor = GFLRandomColor;
    [self setHidesBottomBarWhenPushed:NO];
    [self.navigationItem setTitle:@"借款"];
    [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:19],NSForegroundColorAttributeName:[UIColor blackColor]}];
    [self.view addSubview:self.newsBannerView];
    [self.newsBannerView startTimerWhenAutoScroll];
    [self.view addSubview:self.middleContentView];
    [self.view addSubview:self.bottomLoanConetntView];
}

- (void)fetchNewsDataAndReload
{
    [self.kvoBinder observe:self.newsViewModel
                    keyPath:@"newsModel"
                    options:NSKeyValueObservingOptionNew
                      block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
                          [self.newsBannerView reloadData];
                      }];
    [self.newsViewModel fetchLoanNewsInfoList];
}



#pragma mark - Getters & Setters
- (YJBannerView *)newsBannerView
{
    if (!_newsBannerView)
    {
        _newsBannerView = [YJBannerView bannerViewWithFrame:CGRectMake(0, 20, GFL_SCREEN_WIDTH, GFL_SCREEN_WIDTH/2)
                                                 dataSource:self
                                                   delegate:self
                                                 emptyImage:[UIImage imageNamed:@"placeholder"]
                                           placeholderImage:[UIImage imageNamed:@"placeholder"]
                                             selectorString:@"sd_setImageWithURL:placeholderImage:"];
        _newsBannerView.autoDuration = 2.5f;
        _newsBannerView.autoScroll = YES;
        _newsBannerView.titleFont = [UIFont systemFontOfSize:20];
    }
    return _newsBannerView;
}

- (UIView *)bottomLoanConetntView
{
    if (!_bottomLoanConetntView)
    {
        _bottomLoanConetntView = [UIView new];
        _bottomLoanConetntView.frame = CGRectMake(0, CGRectGetMaxY(self.middleContentView.frame), GFL_SCREEN_WIDTH, GFL_SCREEN_HEIGHT - CGRectGetMaxY(self.middleContentView.frame));
        _bottomLoanConetntView.backgroundColor = GFLRandomColor;
    }
    return _bottomLoanConetntView;
}
- (GFLLoanNewsViewModel *)newsViewModel
{
    if (!_newsViewModel)
    {
        _newsViewModel = [GFLLoanNewsViewModel new];
    }
    return _newsViewModel;
}

- (FBKVOController *)kvoBinder
{
    if(!_kvoBinder)
    {
        _kvoBinder = [FBKVOController controllerWithObserver:self];
    }
    return _kvoBinder;
}

- (UIView *)middleContentView
{
    if (!_middleContentView)
    {
        _middleContentView = [GFLLoanMiddleContent new];
        _middleContentView.frame = CGRectMake(0, CGRectGetMaxY(self.newsBannerView.frame), GFL_SCREEN_WIDTH, 100);
    }
    return _middleContentView;
}
@end
