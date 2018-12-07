//
//  ImageViewController.m
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/7.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.imageView.frame = self.view.bounds;
    self.imageView.image = self.image;
}

@end
