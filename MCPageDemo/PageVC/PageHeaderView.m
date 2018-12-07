//
//  PageHeaderView.m
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/30.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "PageHeaderView.h"
@interface PageHeaderView()
@property (nonatomic, strong) UIView *indicatorView;
@property (nonatomic, assign) CGFloat itemWidth;
@end
@implementation PageHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundColor = [UIColor yellowColor];
    int count = 4;
    _itemWidth = self.frame.size.width/count;
    for (int i = 0; i < count; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*_itemWidth, 0, _itemWidth, self.frame.size.height)];
        [button setTitle:[NSString stringWithFormat:@"title%d",i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        button.tag = 10000 + i;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    _indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 2, _itemWidth, 2)];
    _indicatorView.backgroundColor = [UIColor redColor];
    [self addSubview:_indicatorView];
}

- (void)buttonAction:(UIButton *)button {
    NSUInteger index = button.tag - 10000;
    CGRect rect = self.indicatorView.frame;
    rect.origin.x = index*_itemWidth;
    [UIView animateWithDuration:0.5 animations:^{
        self.indicatorView.frame = rect;
    }];
    
    if (self.block){
        self.block(index);
    }
}

- (void)setCurrentIndex:(NSUInteger )currentIndex {
    _currentIndex = currentIndex;
    CGRect rect = self.indicatorView.frame;
    rect.origin.x = _currentIndex*_itemWidth;
    [UIView animateWithDuration:0.3 animations:^{
        self.indicatorView.frame = rect;
    }];
}

@end
