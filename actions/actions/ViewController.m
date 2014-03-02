//
//  ViewController.m
//  actions
//
//  Created by Evan Miyaki on 2/21/14.
//  Copyright (c) 2014 chicagobulls. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (assign, nonatomic) NSUInteger points;
@end

@implementation ViewController
- (IBAction)ninja:(UIButton *)sender {
    sender.backgroundColor = [UIColor magentaColor];
    
    // Increment the tally:
    self.points = self.points + 1;
    
    // Show the new score:
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.points];
 
}
- (IBAction)ninja2:(UIButton *)sender {
    sender.backgroundColor = [UIColor clearColor];
    
    // Increment the tally:
    self.points = self.points + 5;
    
    // Show the new score:
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", self.points];
}


@end
