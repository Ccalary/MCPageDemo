//
//  DetailViewController.m
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/30.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (nonatomic, strong) UILabel *contentLabel;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}

- (void)dealloc {
    NSLog(@"dealloc:%@",self.mark);
}

- (void)initView {
    self.view.backgroundColor = [UIColor whiteColor];
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont systemFontOfSize:20];
    _contentLabel.textAlignment = NSTextAlignmentCenter;
    _contentLabel.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_contentLabel];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear:%@",self.mark);
    
    _contentLabel.frame = CGRectMake(0, 0, 100, 40);
    _contentLabel.text = [NSString stringWithFormat:@"page-%@",self.mark];
    _contentLabel.center = self.view.center;
}

@end
