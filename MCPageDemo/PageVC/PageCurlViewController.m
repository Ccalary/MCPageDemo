//
//  PageCurlViewController.m
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/30.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "PageCurlViewController.h"
#import "ImageViewController.h"
#import "GlobalHeader.h"

@interface PageCurlViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation PageCurlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
- (void)initView {
    self.navigationItem.title = @"翻页";
    self.view.backgroundColor = [UIColor whiteColor];
    /**
     UIPageViewControllerSpineLocationMin 单页显示
     UIPageViewControllerSpineLocationMid 双页显示
     */
    NSDictionary * options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pageVC.delegate = self;
    self.pageVC.dataSource = self;
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    self.pageVC.view.frame = CGRectMake(0, TopFullHeight, ScreenWidth, ScreenHeight - TopFullHeight);
    [self.pageVC didMoveToParentViewController:self];
    
    self.dataArray = [NSMutableArray arrayWithArray:[self createPageData]];
    
    ImageViewController *vc = [self viewControllerAtIndex:0];
    
    [self.pageVC setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
    }];
}

- (NSArray *)createPageData {
    NSMutableArray *array = [NSMutableArray array];
    UIImage *image1 = [UIImage imageNamed:@"1.jpg"];
    UIImage *image2 = [UIImage imageNamed:@"2.jpg"];
    UIImage *image3 = [UIImage imageNamed:@"3.jpg"];
    UIImage *image4 = [UIImage imageNamed:@"4.jpg"];
    [array addObject:image1];
    [array addObject:image2];
    [array addObject:image3];
    [array addObject:image4];
    return [array copy];
}

- (ImageViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.dataArray count] == 0) || (index >= [self.dataArray count])) {
        return nil;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
    ImageViewController *contentVC = [[ImageViewController alloc] init];
    contentVC.view.frame = self.pageVC.view.bounds;
    contentVC.image = [self.dataArray objectAtIndex:index];
    return contentVC;
}

#pragma mark - DataSource

// 返回前一个控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self indexOfViewController:(ImageViewController *)viewController];
    if (index == 0){
        return nil;
    }
    
    return [self viewControllerAtIndex:index - 1];
}

// 返回后一个控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger index = [self indexOfViewController:(ImageViewController *)viewController];
    if (index + 1 == self.dataArray.count){
        return nil;
    }
    
    return [self viewControllerAtIndex:index + 1];
}

#pragma mark - Delegate

// 手势开始
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    
}

// 手势结束
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    
}

- (NSUInteger)indexOfViewController:(ImageViewController *)viewController {
    return [self.dataArray indexOfObject:viewController.image];
}


@end
