//
//  ViewController.m
//  stokeEndStudy
//
//  Created by Tim Geng on 3/3/15.
//  Copyright (c) 2015 PwC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong) CAShapeLayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _layer = [CAShapeLayer layer];
    self.layer.frame = CGRectMake(100, 100, 200, 200);

    [self.view.layer addSublayer:_layer];
    _layer.strokeColor = [UIColor lightGrayColor].CGColor;
    _layer.fillColor = [UIColor clearColor].CGColor;
    _layer.lineWidth = 3.0;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:50 startAngle:-(M_PI_4) endAngle:(M_PI * 2 - M_PI_4 ) * 2 clockwise:YES];
    _layer.path = path.CGPath;
    
    CABasicAnimation *animationStokeEnd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animationStokeEnd.duration = 2.0;
    animationStokeEnd.fromValue = [NSNumber numberWithFloat:0.0];
    animationStokeEnd.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    animationStokeEnd.toValue = [NSNumber numberWithFloat:1.0];
    
    CABasicAnimation *animationStokeStart = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animationStokeStart.duration = 2.0;
    animationStokeStart.fromValue = [NSNumber numberWithFloat:0.0];
    animationStokeStart.toValue = [NSNumber numberWithFloat:1.0];
    //animationStokeStart.timingFunction = [CAMediaTimingFunction functionWithName:kcam]
    
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = [NSArray arrayWithObjects:animationStokeEnd,animationStokeStart, nil];
    animationGroup.duration = 2;
    animationGroup.repeatCount = HUGE_VAL;
    [_layer addAnimation:animationGroup forKey:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
