//
//  ViewController.m
//  YZHUISearchBarDemo
//
//  Created by yuan on 2018/12/20.
//  Copyright © 2018年 yuan. All rights reserved.
//

#import "ViewController.h"
#import "YZHUISearchBar/YZHUISearchBar.h"
#import "UIView+Geometry.h"

@interface ViewController ()

/* <#注释#> */
@property (nonatomic, strong) YZHUISearchBar *searchBar;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self _test];
}

-(void)_test
{
    CGFloat x = 0;
    CGFloat y = 100;
    CGFloat w = SCREEN_WIDTH;
    CGFloat h = 44;
    self.searchBar = [[YZHUISearchBar alloc] initWithFrame:CGRectMake(x, y, w, h)];
    self.searchBar.placeholder = [[NSAttributedString alloc] initWithString:@"搜索" attributes:@{NSFontAttributeName:FONT(14)}];
    self.searchBar.backgroundColor = WhiteColorFour;
    
    UIImage *image = [UIImage imageNamed:@"search_icon"];
//    self.searchBar.imageView.image = image;
    [self.searchBar setSearchImage:image];
    [self.view addSubview:self.searchBar];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
