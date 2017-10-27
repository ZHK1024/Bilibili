//
//  ViewController.m
//  Bilibili
//
//  Created by Apple-T on 16/9/11.
//  Copyright © 2016年 Apple-T. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeLiveListViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) UIScrollView *backScrollView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view addSubview:self.backScrollView];
    
    HomeLiveListViewController *liveVC = [[HomeLiveListViewController alloc] init];
    [self addChildViewController:liveVC];
    
    [_backScrollView addSubview:liveVC.view];
    
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Getter

- (UIScrollView *)backScrollView {
    if (_backScrollView == nil) {
        self.backScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
        _backScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.view.frame) * 3, 0);
        _backScrollView.pagingEnabled = YES;
        _backScrollView.bounces = NO;
    }
    return _backScrollView;
}

@end
