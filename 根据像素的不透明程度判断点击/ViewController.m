//
//  ViewController.m
//  根据像素的不透明程度判断点击
//
//  Created by 孙继桐 on 2016/11/3.
//  Copyright © 2016年 Sun. All rights reserved.
//

#import "ViewController.h"
#import "SJTTouchImageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SJTTouchImageView *imageView = [[SJTTouchImageView alloc] initWithImage:[UIImage imageNamed:@"woye"]];
    imageView.frame = CGRectMake(100, 100, 180, 169);
    [self.view addSubview:imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [imageView addGestureRecognizer:tap];
    
}

- (void)tap{
    NSLog(@"1111");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
