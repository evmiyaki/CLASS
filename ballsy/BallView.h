//
//  BallView.h
//  
//
//  Created by Evan Miyaki on 3/2/14.
//
//

#import <UIKit/UIKit.h>

@interface BallView : UIView

- (id)initWithFrame:(CGRect)frame worldSize:(CGSize)worldSize;
- (void)moveWithGravity:(CGPoint)gravity;

@end
