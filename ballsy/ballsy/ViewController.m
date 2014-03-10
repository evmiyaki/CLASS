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

<<<<<<< HEAD
@property (strong, nonatomic) BallView *BallView;
=======
@property (strong, nonatomic) BallView *ballView;
>>>>>>> 943280bf283aba638263bb0516618ced341ae327

@property (assign, nonatomic) CGFloat gravity;
@property (weak, nonatomic) IBOutlet UILabel *accelXLabel;
@property (weak, nonatomic) IBOutlet UILabel *accelYLabel;
@property (weak, nonatomic) IBOutlet UILabel *accelZLabel;
@property (strong, nonatomic) CMMotionManager *motionManager;
@end

@implementation ViewController

- (void)tick:(CADisplayLink *)sender
{
    CMAccelerometerData *accelData = self.motionManager.accelerometerData;
    
    // Update acceleration labels:
    self.accelXLabel.text = [NSString stringWithFormat:@"acceleration x: %.2f", accelData.acceleration.x];
    self.accelYLabel.text = [NSString stringWithFormat:@"acceleration y: %.2f", accelData.acceleration.y];
    self.accelZLabel.text = [NSString stringWithFormat:@"acceleration z: %.2f", accelData.acceleration.z];
    
    // Update ball position:
    CGPoint gravityForce = CGPointMake( accelData.acceleration.x * self.gravity,
                                       -accelData.acceleration.y * self.gravity);
    [self.BallView moveWithGravity:gravityForce];
}

- (void)setupMotionManager
{
    self.motionManager = [[CMMotionManager alloc] init];
    
    if ([self.motionManager isAccelerometerAvailable]) {
        self.motionManager.accelerometerUpdateInterval = 1.0/60.0;
        [self.motionManager startAccelerometerUpdates];
    } else {
        NSLog(@"Accelerometer is not available.");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create a ball:
<<<<<<< HEAD
    self.BallView = [[BallView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)
=======
    self.ballView = [[BallView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)
>>>>>>> 943280bf283aba638263bb0516618ced341ae327
                                            worldSize:self.view.bounds.size];
    [self.view addSubview:self.BallView];
    
    // Set world gravitational force (to center of earth via accelerometers):
    self.gravity = 5.0;
    
    // Set up the display loop:
    self.displayLink = [CADisplayLink displayLinkWithTarget:self
                                                   selector:@selector(tick:)];
    
    [self.displayLink addToRunLoop:[NSRunLoop currentRunLoop]
                           forMode:NSDefaultRunLoopMode];
    
    // Initialize use of accelerometers:
    [self setupMotionManager];
}

@end