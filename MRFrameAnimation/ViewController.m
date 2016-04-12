//
//  ViewController.m
//  MRFrameAnimation
//
//  Created by 阿迪 on 16/3/14.
//  Copyright © 2016年 itrandy.com. All rights reserved.
//

#import "ViewController.h"
#import "UIView+MRFrameAnimation.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *yellowView;

@property (nonatomic, strong) MRFrameAnimationObject *object;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView = [[UIScrollView alloc] init];
    self.scrollView.delegate = self;
    self.scrollView.frame = CGRectMake(0, 0, 1000, 1000);
    self.scrollView.contentSize = CGSizeMake(2000, 1000);
    [self.view addSubview:self.scrollView];
    
    self.yellowView = [[UIView alloc] init];
    self.yellowView.frame = CGRectMake(100, 100, 100, 100);
    self.yellowView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.yellowView];
    
    
    self.object = [self.yellowView animateWithFrameCount:100 animations:^{
        self.yellowView.frame = CGRectMake(200, 200, 200, 200);
    }];
    
//    [self performSelector:@selector(playAnimtion) withObject:nil afterDelay:2.f];
    
    

    
    
}

- (void)playAnimtion
{
    while (self.object && [self.object nextFrame])
    {
        [self.object nextFrame];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    self.object.currentFrame = scrollView.contentOffset.x / 10.f;
}

@end
