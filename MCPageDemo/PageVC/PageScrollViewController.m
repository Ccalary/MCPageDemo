//
//  PageScrollViewController.m
//  MCPageDemo
//
//  Created by caohouhong on 2018/11/30.
//  Copyright © 2018年 caohouhong. All rights reserved.
//

#import "PageScrollViewController.h"
#import "DetailViewController.h"
#import "GlobalHeader.h"
#import "PageHeaderView.h"

@interface PageScrollViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic, strong) PageHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSUInteger currentIndex;

@end

@implementation PageScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (void)initView {
    self.navigationItem.title = @"滚动";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _headerView = [[PageHeaderView alloc] initWithFrame:CGRectMake(0, TopFullHeight, ScreenWidth, 50)];
    __weak typeof (self) weakSelf = self;
    _headerView.block = ^(NSUInteger index) {
        DetailViewController *vc = [weakSelf viewControllerAtIndex:index];
        
        [weakSelf.pageVC setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:^(BOOL finished) {
        }];
    };
    [self.view addSubview:_headerView];
    
    
    /**
     UIPageViewControllerSpineLocationMin 单页显示
     UIPageViewControllerSpineLocationMid 双页显示
     */
    NSDictionary * options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin] forKey:UIPageViewControllerOptionSpineLocationKey];
    
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
    self.pageVC.delegate = self;
    self.pageVC.dataSource = self;
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    self.pageVC.view.frame = CGRectMake(0, CGRectGetMaxY(self.headerView.frame), ScreenWidth, ScreenHeight - TopFullHeight - 50);
    [self.pageVC didMoveToParentViewController:self];
    
    self.dataArray = [NSMutableArray arrayWithArray:[self createPageData]];
    
    DetailViewController *vc = [self viewControllerAtIndex:0];
    
    [self.pageVC setViewControllers:@[vc] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:^(BOOL finished) {
    }];
}



- (NSArray *)createPageData {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 4; i ++) {
        [array addObject:[NSString stringWithFormat:@"%d",i]];
    }
    return [array copy];
}

- (DetailViewController *)viewControllerAtIndex:(NSUInteger)index {
    if (([self.dataArray count] == 0) || (index >= [self.dataArray count])) {
        return nil;
    }
    // 创建一个新的控制器类，并且分配给相应的数据
    DetailViewController *contentVC = [[DetailViewController alloc] init];
    contentVC.view.frame = self.pageVC.view.bounds;
    contentVC.mark = [self.dataArray objectAtIndex:index];
    return contentVC;
}

#pragma mark - DataSource

// 返回前一个控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    NSInteger index = [self indexOfViewController:(DetailViewController *)viewController];
    if (index == 0){
        return nil;
    }
    return [self viewControllerAtIndex:index - 1];
}

// 返回后一个控制器
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger index = [self indexOfViewController:(DetailViewController *)viewController];
    if (index + 1 == self.dataArray.count){
        return nil;
    }
    return [self viewControllerAtIndex:index + 1];
}


#pragma mark - Delegate

// 手势开始
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers {
    UIViewController *vc = pendingViewControllers.firstObject;
    NSInteger index = [self indexOfViewController:(DetailViewController *)vc];
    self.currentIndex = index;
}

// 手势结束
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (completed) {
         self.headerView.currentIndex = self.currentIndex;
    }
}

- (NSUInteger)indexOfViewController:(DetailViewController *)viewController {
    return [self.dataArray indexOfObject:viewController.mark];
}
@end
