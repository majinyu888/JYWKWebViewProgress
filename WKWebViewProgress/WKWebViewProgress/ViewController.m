//
//  ViewController.m
//  WKWebViewProgress
//
//  Created by hb on 2017/4/21.
//  Copyright © 2017年 com.bm.hb. All rights reserved.
//

#import "ViewController.h"
#import "JYWebController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (IBAction)push:(id)sender
{
    JYWebController *vc = [[JYWebController alloc] init];
    vc.url = @"https://www.baidu.com";
   [self.navigationController pushViewController:vc animated:YES];
}


@end
