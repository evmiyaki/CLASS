//
//  BallView.m
//  
//
//  Created by Evan Miyaki on 3/2/14.
//
//

#import "BallView.h"

@interface BallView ()
@property (assign, nonatomic) CGFloat dampeningFactor;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (strong, nonatomic) UIColor *color;

@end

@implementation BallView


- (id)initWithFrame:(CGRect)frame

{
    self = [super initWithFrame:frame];
    CGFloat hue = ( arc4random() % 256 / 256.0 );  //  0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
    UIColor *color = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
        self.dampeningFactor = 0.9;
    }
    return self;
}

- (void)move
{
    CGPoint vel = self.velocity;
    
    // Bounce of the left and right sides:
    CGFloat width = self.superview.bounds.size.width;
    if (CGRectGetMaxX(self.frame) >= width) {
        vel.x = -ABS(vel.x) * self.dampeningFactor;
    } else if (CGRectGetMinX(self.frame) <= 0) {
        vel.x = ABS(vel.x) * self.dampeningFactor;
    }
    
    // Bounce off the bottom and top:
    CGFloat height = self.superview.bounds.size.height;
    if (CGRectGetMaxY(self.frame) >= height) {
        vel.y = -ABS(vel.y) * self.dampeningFactor;
    } else if (CGRectGetMinY(self.frame) <= 0) {
        vel.y = ABS(vel.y) * self.dampeningFactor;
    }

//    // Apply gravitational force:
//    vel.x += gravity.x;
//    vel.y += gravity.y;
    self.velocity = vel;

    // Update location:
    CGPoint currentLoc = self.frame.origin;

    // Constrain x-position of the ball:
    CGFloat maxPosX = width - CGRectGetWidth(self.bounds);
    currentLoc.x = MAX(0, MIN(maxPosX, currentLoc.x + self.velocity.x));

    // Constrain y-position of the ball:
    CGFloat maxPosY = height - CGRectGetHeight(self.bounds);
    currentLoc.y = MAX(0, MIN(maxPosY, currentLoc.y + self.velocity.y));

    CGRect newFrame = self.frame;
    newFrame.origin = currentLoc;
    self.frame = newFrame;
}

@end