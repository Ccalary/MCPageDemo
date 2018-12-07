//
//  ViewController.m
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/7.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "ViewController.h"
#import "PageCurlViewController.h"
#import "PageScrollViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)curlAction:(UIButton *)sender {
    PageCurlViewController *vc = [[PageCurlViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)scrollAction:(UIButton *)sender {
    PageScrollViewController *vc = [[PageScrollViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
