//
//  GlobalHeader.h
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/30.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#ifndef GlobalHeader_h
#define GlobalHeader_h

//大小尺寸
#define ScreenWidth                     [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight                   ([[UIScreen mainScreen] bounds].size.height)

//statusBar高度
#define StatusBarHeight                 [UIApplication sharedApplication].statusBarFrame.size.height
//navBar高度
#define NavigationBarHeight             [[UINavigationController alloc] init].navigationBar.frame.size.height
//TabBar高度  iPhoneX 高度为83
#define TabBarHeight                    ((StatusBarHeight > 20.0f) ? 83.0f : 49.0f)
//nav顶部高度
#define TopFullHeight                   (StatusBarHeight + NavigationBarHeight)

//屏幕适配
#define UIRate                          ScreenWidth/375.0


#endif /* GlobalHeader_h */
