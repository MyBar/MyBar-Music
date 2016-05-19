//
//  MBNewFeatureViewController.m
//  MyBarBlog
//
//  Created by tarena on 16/4/18.
//  Copyright © 2016年 tarena. All rights reserved.
//

#import "MBNewFeatureViewController.h"
#define MBNewFeatureImageCount 5

@interface MBNewFeatureViewController () <UIScrollViewDelegate>

@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, weak) UIPageControl *pageControl;

@end

@implementation MBNewFeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    [self setupScrollView];
    [self setupPageControl];
}

- (void)setupScrollView {
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:self.view.bounds];
    
    for (int i = 0; i < MBNewFeatureImageCount; i++) {
        CGRect frame = CGRectMake(i * scrollView.width, 0, scrollView.width, scrollView.height);
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:frame];
        
        NSString *imageName = [NSString stringWithFormat:@"Welcome_3.0_%d", i + 1];
        imageView.image = [UIImage imageNamed:imageName];
        
        [scrollView addSubview:imageView];
        
        if (i == MBNewFeatureImageCount - 1) {
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction)];
            
            imageView.userInteractionEnabled = YES;
            [imageView addGestureRecognizer:tap];
        }
    }
    
    // 如果想要某个方向上不能滚动，那么这个方向对应的尺寸数值传0即可
    scrollView.contentSize = CGSizeMake(MBNewFeatureImageCount * scrollView.width, 0);
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    
    self.scrollView = scrollView;
    [self.view addSubview:scrollView];
}

- (void)tapAction {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UINavigationController *mainNavVC = [storyboard instantiateViewControllerWithIdentifier:@"mainNavVC"];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = mainNavVC;
}

- (void)setupPageControl {
    CGRect frame = self.view.frame;
    UIPageControl *pageControl = [UIPageControl new];
    pageControl.numberOfPages = MBNewFeatureImageCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = MBColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = MBColor(189, 189, 189);
    pageControl.currentPage = 0;
    pageControl.center = CGPointMake(frame.size.width * 0.5, frame.size.height * 0.9);
    
    self.pageControl = pageControl;
    [self.view addSubview:pageControl];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.pageControl.currentPage = scrollView.contentOffset.x / scrollView.frame.size.width + 0.5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}


@end
