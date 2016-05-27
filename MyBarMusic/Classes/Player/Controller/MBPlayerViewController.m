//
//  MBPlayerViewController.m
//  MyBarMusic
//
//  Created by lijingui2010 on 16/5/27.
//  Copyright © 2016年 MyBar. All rights reserved.
//

#import "MBPlayerViewController.h"

@implementation MBPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = MBVC_BGCOLOR;
    
    [self setupNavigation];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)setupNavigation {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    
}

- (IBAction)tapBackBarButtonItemAction:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapMoreBarButtonItemAction:(UIButton *)sender {
}

@end
