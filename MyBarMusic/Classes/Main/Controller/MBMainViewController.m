//
//  MBMainViewController.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/19.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBMainViewController.h"

@interface MBMainViewController ()

@end

@implementation MBMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MBVC_BGCOLOR;
    
    [self setupNavigationBar];
    
    
}

- (void)setupNavigationBar {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"vc_head_bg"] forBarMetrics:UIBarMetricsDefault];
    
}

@end
