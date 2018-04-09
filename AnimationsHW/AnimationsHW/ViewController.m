//
//  ViewController.m
//  AnimationsHW
//
//  Created by Ivan Kozaderov on 04.03.2018.
//  Copyright © 2018 Ivan Kozaderov. All rights reserved.
//
//#define PUPIL
#define STUDENT
#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,weak) UIView* view1;
@property(nonatomic,weak) UIView* view2;
@property(nonatomic,weak) UIView* view3;
@property(nonatomic,weak) UIView* view4;

@property(nonatomic,weak) UIView* view5;
@property(nonatomic,weak) UIView* view6;
@property(nonatomic,weak) UIView* view7;
@property(nonatomic,weak) UIView* view8;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 #ifdef PUPIL
    CGRect  rect1 = CGRectMake(CGRectGetMinX(self.view.frame),CGRectGetMinY(self.view.frame) + 100, 50, 50);
    UIView* view1 = [[UIView alloc] initWithFrame:rect1];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    self.view1 = view1;
    
    CGRect  rect2 = CGRectMake(CGRectGetMinX(self.view.frame),CGRectGetMinY(self.view.frame) + 200, 50, 50);
    UIView* view2 = [[UIView alloc] initWithFrame:rect2];
    view2.backgroundColor = [UIColor redColor];
    [self.view addSubview:view2];
    self.view2 = view2;
    
    CGRect  rect3 = CGRectMake(CGRectGetMinX(self.view.frame),CGRectGetMinY(self.view.frame) + 300, 50, 50);
    UIView* view3 = [[UIView alloc] initWithFrame:rect3];
    view3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view3];
    self.view3 = view3;
    
    CGRect  rect4 = CGRectMake(CGRectGetMinX(self.view.frame),CGRectGetMinY(self.view.frame) + 400, 50, 50);
    UIView* view4 = [[UIView alloc] initWithFrame:rect4];
    view4.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view4];
    self.view4 = view4;
#endif
    
    
#ifdef STUDENT
    
    UIView* view5 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view5.center = [self centerOfView:view5 nearCorner:CornerLeftTop];
    view5.backgroundColor = [self  colorInCorner:CornerLeftTop];
    
    
    UIView* view6 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view6.center = [self centerOfView:view6 nearCorner:CornerLeftBottom];
    view6.backgroundColor = [self  colorInCorner:CornerLeftBottom];
    
    
    UIView* view7 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view7.center = [self centerOfView:view7 nearCorner:CornerRightTop];
    view7.backgroundColor = [self  colorInCorner:CornerRightTop];
    
    
    UIView* view8 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    view8.center = [self centerOfView:view8 nearCorner:CornerRightBottom];
    view8.backgroundColor = [self  colorInCorner:CornerRightBottom];
   
    self.view5 = view5;
    self.view6 = view6;
    self.view7 = view7;
    self.view8 = view8;
    
    [self.view addSubview:view5];
    [self.view addSubview:view6];
    [self.view addSubview:view7];
    [self.view addSubview:view8];
    
    
  [self moveRects];
    
#endif
    
}


-(CGPoint)centerOfView:(UIView*)view nearCorner:(Corners)corners{
   
    CGFloat width        = CGRectGetWidth(view.frame);
    CGFloat height       = CGRectGetHeight(view.frame);
    CGFloat widthScreen  = CGRectGetWidth(self.view.bounds);
    CGFloat heightScreen = CGRectGetHeight(self.view.bounds);
    
    switch (corners) {
        case CornerLeftTop:
            return CGPointMake(width/2,height/2);
        case CornerLeftBottom:
            return CGPointMake(width/2, heightScreen - height/2);
        case CornerRightTop:
            return CGPointMake(widthScreen - width/2, height/2);
        case CornerRightBottom:
            return CGPointMake(widthScreen - width/2, heightScreen - height/2);
            
    }

}

-(UIColor*) colorInCorner:(Corners)corners{
    
    switch (corners) {
        case CornerLeftTop:
            return [UIColor redColor];
        case CornerLeftBottom:
            return [UIColor yellowColor];
        case CornerRightTop:
            return [UIColor greenColor];
        case CornerRightBottom:
            return [UIColor blueColor];
            
    }
    
}

-(Corners) currentCornerOfView:(UIView*) view{
    
    CGPoint PointLeftTop     = CGPointMake(25, 25);
    CGPoint PointLeftBottom  = CGPointMake(25, 711);
    CGPoint PointRightTop    = CGPointMake(389, 25);
    CGPoint PointRightBottom = CGPointMake(389, 711);

    Corners currentCorner = 0;
    
    if(CGPointEqualToPoint(PointLeftTop, view.center))      currentCorner = CornerLeftTop  ;
    if(CGPointEqualToPoint(PointLeftBottom, view.center))   currentCorner = CornerLeftBottom  ;
    if(CGPointEqualToPoint(PointRightTop, view.center))     currentCorner = CornerRightTop  ;
    if(CGPointEqualToPoint(PointRightBottom, view.center))  currentCorner = CornerRightBottom  ;
    
    return currentCorner ;
    
}

-(Corners) newCornerOfView:(UIView*) view inDirection:(NSUInteger) direction{
    
    switch ([self currentCornerOfView:view]) {
        case CornerLeftTop:
            return direction ? CornerRightTop : CornerLeftBottom;
        case CornerLeftBottom:
            return direction ? CornerLeftTop : CornerRightBottom;
        case CornerRightTop:
            return direction ? CornerRightBottom : CornerLeftTop;
        case CornerRightBottom:
            return direction ? CornerLeftBottom : CornerRightTop;
    }
    
}




-(void) moveRects{

    
    NSUInteger direction = arc4random()%2;
    
    [UIView animateWithDuration:4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         
                         self.view5.center = [self centerOfView:self.view5 nearCorner:[self newCornerOfView:self.view5 inDirection:direction]];
                         self.view6.center = [self centerOfView:self.view6 nearCorner:[self newCornerOfView:self.view6 inDirection:direction]];
                         self.view7.center = [self centerOfView:self.view7 nearCorner:[self newCornerOfView:self.view7 inDirection:direction]];
                         self.view8.center = [self centerOfView:self.view8 nearCorner:[self newCornerOfView:self.view8 inDirection:direction]];
               
                         
                     }
                     completion:^(BOOL finished) {
                       
                         self.view5.backgroundColor = [self colorInCorner:[self currentCornerOfView:self.view5]];
                         self.view6.backgroundColor = [self colorInCorner:[self currentCornerOfView:self.view6]];
                         self.view7.backgroundColor = [self colorInCorner:[self currentCornerOfView:self.view7]];
                         self.view8.backgroundColor = [self colorInCorner:[self currentCornerOfView:self.view8]];
                         
                         [self moveRects];
                     }];
    
 
}


-(UIColor*)randomColor{
    
    CGFloat r = (float)(arc4random()%256)/255;
    CGFloat g = (float)(arc4random()%256)/255;
    CGFloat b = (float)(arc4random()%256)/255;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

-(void) viewDidAppear:(BOOL)animated{
    
#ifdef PUPIL
    
    [UIView animateWithDuration:4
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         self.view1.center = CGPointMake(CGRectGetWidth(self.view.bounds), self.view1.center.y );
                         self.view1.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animations finished");
                     }];
    
    [UIView animateWithDuration:4
                          delay:0
                        options:UIViewAnimationOptionCurveEaseIn | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
           
                         self.view2.center = CGPointMake(CGRectGetWidth(self.view.bounds), self.view2.center.y );
                         self.view2.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animations finished");
                     }];

    [UIView animateWithDuration:4
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut| UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         self.view3.center = CGPointMake(CGRectGetWidth(self.view.bounds), self.view3.center.y );
                         self.view3.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animations finished");
                     }];

    [UIView animateWithDuration:4
                          delay:0
                        options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         
                         
                         self.view4.center = CGPointMake(CGRectGetWidth(self.view.bounds), self.view4.center.y );
                         self.view4.backgroundColor = [self randomColor];
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"animations finished");
                     }];
    
#endif


}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
