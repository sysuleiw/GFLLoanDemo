//
//  GFLDefine.h
//  GFLoanDemo
//
//  Created by 王磊 on 2018/5/13.
//  Copyright © 2018年 王磊. All rights reserved.
//

#ifndef GFLDefine_h
#define GFLDefine_h

/// 应用名称
#define GFL_APP_NAME    ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleName"])
/// 应用版本号
#define GFL_APP_VERSION ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
/// 应用build
#define GFL_APP_BUILD   ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])



// 输出日志 (格式: [时间] [哪个方法] [哪行] [输出内容])
#ifdef DEBUG
#define NSLog(format, ...)  printf("\n[%s] %s [第%d行] 💕 %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ##__VA_ARGS__] UTF8String]);
#else

#define NSLog(format, ...)

#endif
// 打印方法
#define GFLLogFunc NSLog(@"%s", __func__)
// 打印请求错误信息
#define GFLLogError(error) NSLog(@"Error: %@", error)
// 销毁打印
#define GFLDealloc NSLog(@"\n =========+++ %@  销毁了 +++======== \n",[self class])

#define GFLLogLastError(db) NSLog(@"lastError: %@, lastErrorCode: %d, lastErrorMessage: %@", [db lastError], [db lastErrorCode], [db lastErrorMessage]);


/// 类型相关
#define GFL_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define GFL_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define GFL_IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)

/// 屏幕尺寸相关
#define GFL_SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define GFL_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define GFL_SCREEN_BOUNDS ([[UIScreen mainScreen] bounds])
#define GFL_SCREEN_MAX_LENGTH (MAX(GFL_SCREEN_WIDTH, GFL_SCREEN_HEIGHT))
#define GFL_SCREEN_MIN_LENGTH (MIN(GFL_SCREEN_WIDTH, GFL_SCREEN_HEIGHT))

/// 手机类型相关
#define GFL_IS_IPHONE_4_OR_LESS  (GFL_IS_IPHONE && GFL_SCREEN_MAX_LENGTH  < 568.0)
#define GFL_IS_IPHONE_5          (GFL_IS_IPHONE && GFL_SCREEN_MAX_LENGTH == 568.0)
#define GFL_IS_IPHONE_6          (GFL_IS_IPHONE && GFL_SCREEN_MAX_LENGTH == 667.0)
#define GFL_IS_IPHONE_6P         (GFL_IS_IPHONE && GFL_SCREEN_MAX_LENGTH == 736.0)
#define GFL_IS_IPHONE_X          (GFL_IS_IPHONE && GFL_SCREEN_MAX_LENGTH == 812.0)


/// 导航条高度
#define GFL_APPLICATION_TOP_BAR_HEIGHT (GFL_IS_IPHONE_X?88.0f:64.0f)
/// tabBar高度
#define GFL_APPLICATION_TAB_BAR_HEIGHT (GFL_IS_IPHONE_X?83.0f:49.0f)
/// 工具条高度 (常见的高度)
#define GFL_APPLICATION_TOOL_BAR_HEIGHT_44  44.0f
#define GFL_APPLICATION_TOOL_BAR_HEIGHT_49  49.0f
/// 状态栏高度
#define GFL_APPLICATION_STATUS_BAR_HEIGHT (GFL_IS_IPHONE_X?44:20.0f)




///------
/// iOS Version
///------
#define GFLIOSVersion ([[[UIDevice currentDevice] systemVersion] floatValue])

#define GFL_iOS7_VERSTION_LATER ([UIDevice currentDevice].systemVersion.floatValue >= 7.0)
#define GFL_iOS8_VERSTION_LATER ([UIDevice currentDevice].systemVersion.floatValue >= 8.0)
#define GFL_iOS9_VERSTION_LATER ([UIDevice currentDevice].systemVersion.floatValue >= 9.0)
#define GFL_iOS10_VERSTION_LATER ([UIDevice currentDevice].systemVersion.floatValue >= 10.0)

#define GFL_SYSTEM_VERSION_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define GFL_SYSTEM_VERSION_GREATER_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define GFL_SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define GFL_SYSTEM_VERSION_LESS_THAN(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define GFL_SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v) ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


// KVO获取监听对象的属性 有自动提示
// 宏里面的#，会自动把后面的参数变成c语言的字符串
#define GFLKeyPath(objc,keyPath) @(((void)objc.keyPath ,#keyPath))

// 颜色
#define GFLColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
// 颜色+透明度
#define GFLColorAlpha(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
// 随机色
#define GFLRandomColor GFLColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
// 根据rgbValue获取对应的颜色
#define GFLColorFromRGB(__rgbValue) [UIColor colorWithRed:((float)((__rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((__rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(__rgbValue & 0xFF))/255.0 alpha:1.0]

#define GFLColorFromRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]


// AppCaches 文件夹路径
#define GFLCachesDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject]
// App DocumentDirectory 文件夹路径
#define GFLDocumentDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) lastObject]

// 系统放大倍数
#define GFLScale [[UIScreen mainScreen] scale]

// 设置图片
#define GFLImageNamed(__imageName) [UIImage imageNamed:__imageName]

/// 根据hex 获取颜色
#define GFLColorFroGFLexString(__hexString__) ([UIColor colorFroGFLexString:__hexString__])

//  通知中心
#define GFLNotificationCenter [NSNotificationCenter defaultCenter]

// 是否为空对象
#define GFLObjectIsNil(__object)  ((nil == __object) || [__object isKindOfClass:[NSNull class]])

// 字符串为空
#define GFLStringIsEmpty(__string) ((__string.length == 0) || GFLObjectIsNil(__string))

// 字符串不为空
#define GFLStringIsNotEmpty(__string)  (!GFLStringIsEmpty(__string))

// 数组为空
#define GFLArrayIsEmpty(__array) ((GFLObjectIsNil(__array)) || (__array.count==0))

#pragma mark - Color
#define     GFL_DEFAULT_NAVBAR_COLOR             GFLColorAlpha(20.0, 20.0, 20.0, 0.9)
#define     GFL_DEFAULT_BACKGROUND_COLOR         GFLColorAlpha(239.0, 239.0, 244.0, 1.0)

#define     GFL_DEFAULT_CHAT_BACKGROUND_COLOR    GFLColorAlpha(235.0, 235.0, 235.0, 1.0)
#define     GFL_DEFAULT_CHATBOX_COLOR            GFLColorAlpha(244.0, 244.0, 246.0, 1.0)
#define     GFL_DEFAULT_SEARCHBAR_COLOR          GFLColorAlpha(239.0, 239.0, 244.0, 1.0)
#define     GFL_DEFAULT_GREEN_COLOR              GFLColorAlpha(2.0, 187.0, 0.0, 1.0f)
#define     GFL_DEFAULT_TEXT_GRAY_COLOR         [UIColor grayColor]
#define     GFL_DEFAULT_LINE_GRAY_COLOR          GFLColorAlpha(188.0, 188.0, 188.0, 0.6f)

#endif /* GFLDefine_h */
