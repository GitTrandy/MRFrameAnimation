//
//  ViewController.m
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/14.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MRFrameAnimation.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *yellowView;

@property (nonatomic, strong) MRFrameAnimationObject *object;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.yellowView = [[UIView alloc] init];
    self.yellowView.frame = CGRectMake(100, 100, 100, 100);
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowView];
    
    
    self.object = [self.yellowView animateWithFrameCount:100 animations:^{
        self.yellowView.frame = CGRectMake(200, 100, 100, 100);
    }];
    
}

- (void)playAnimtion
{
    while (self.object && [self.object nextFrame])
    {
        [self.object nextFrame];
        sleep(100);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
