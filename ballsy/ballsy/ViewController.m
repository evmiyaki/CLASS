//
//  ViewController.m
//  ballsy
//
//  Created by Evan Miyaki on 2/24/14.
//  Copyright (c) 2014 chicagobulls. All rights reserved.
//

#import "ViewController.h"
@import QuartzCore;
@import CoreMotion;
#import "BallView.h"

@interface ViewController ()

@property (strong, nonatomic) CADisplayLink *displayLink;

@property (strong, nonatomic) NSMutableArray *balls;

@property (assign, nonatomic) CGPoint gravity;

@property (strong, nonatomic) CMMotionManager *motionManager;
@end

@implementation ViewController

- (void)tick:(CADisplayLink *)sender
{
    for (BallView *ballView in self.balls) {
        [ballView move];
    }
}


- (void)addballviewWithLocation:(CGPoint)location velocity:(CGPoint)velocity size:(CGSize)size
{
    BallView *ballView = [[BallView alloc] initWithFrame:CGRectMake(50.0, 50.0, size.width, size.height)];
    
    ballView.center = location;
    ballView.velocity = velocity;
    [self.view addSubview:ballView];
    [self.balls addObject:ballView];
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create a ball:
    self.balls = [NSMutableArray array];
    for (int i=0; i<200; i++) {
        CGPoint location = CGPointMake(arc4random()%500, arc4random()%500);
        CGPoint velocity = CGPointMake(arc4random()%100, arc4random()%100);
        CGSize size = CGSizeMake(50, 50);
        
        [self addballviewWithLocation:location velocity:velocity size:size];
    }

    // Set world gravitational force (to center of earth via accelerometers):
     self.gravity = CGPointMake(0, 5);
    
    // Set up the display loop:
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(tick:)];
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    
}


@end