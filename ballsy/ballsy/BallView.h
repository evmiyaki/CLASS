//
//  BallView.h
//  
//
//  Created by Evan Miyaki on 3/2/14.
//
//

#import <UIKit/UIKit.h>

@interface BallView : UIView
@property (assign, nonatomic) CGPoint velocity;

- (void)move;

@end
