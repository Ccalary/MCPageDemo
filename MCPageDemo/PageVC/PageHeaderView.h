//
//  PageHeaderView.h
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/30.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^headerClickBlock)(NSUInteger index);
@interface PageHeaderView : UIView
@property (nonatomic, assign) NSUInteger currentIndex;
@property (nonatomic, copy) headerClickBlock block;
@end
