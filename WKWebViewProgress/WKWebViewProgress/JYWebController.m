//
//  JYWebController.m
//  WKWebViewProgress
//
//  Created by hb on 2017/4/21.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

#import "JYWebController.h"
#import <WebKit/WebKit.h>

@interface JYWebController ()<
WKNavigationDelegate
>

@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) UIProgressView *progressView;

@end

@implementation JYWebController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.webView = [[WKWebView alloc] init];
    self.webView.navigationDelegate = self;
    [self.webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.url]]];
    [self.view addSubview:self.webView];
    
    self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
    self.progressView.backgroundColor = [UIColor clearColor];
    self.progressView.progressTintColor = [UIColor clearColor];
    [self.view addSubview:self.progressView];
    
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    self.webView.frame = CGRectMake(0,
                                    64,
                                    self.view.bounds.size.width,
                                    self.view.bounds.size.height - 64);
    
    self.progressView.frame = CGRectMake(self.webView.frame.origin.x,
                                         self.webView.frame.origin.y,
                                         self.webView.frame.size.width,
                                         2);
}

- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    self.title = self.webView.title;
    self.progressView.progress = self.webView.estimatedProgress;
    self.progressView.hidden = self.webView.estimatedProgress >= 1;
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
//    if (webView.title.length) {
//        [webView evaluateJavaScript:@"document.documentElement.getElementsByClassName('maxjia-mobile-header')[0].style.display = 'none'" completionHandler:nil];
//        self.title = webView.title;
//    }
}



@end
