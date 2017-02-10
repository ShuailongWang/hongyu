//
//  HYWebController.m
//  hongyu
//
//  Created by admin on 17/2/10.
//  Copyright © 2017年 wsl. All rights reserved.
//

#import "HYWebController.h"
#import <WebKit/WebKit.h>

@interface HYWebController ()

@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation HYWebController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"详情";
    _wkWebView = [[WKWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_wkWebView];
    
    [_wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.strUrl]]];
}


-(void)setStrUrl:(NSString *)strUrl{
    _strUrl = strUrl;
}

@end
