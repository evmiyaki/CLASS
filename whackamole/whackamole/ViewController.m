//
//  ViewController.m
//  whackamole
//
//  Created by Evan Miyaki on 3/13/14.
//  Copyright (c) 2014 chicagobulls. All rights reserved.
//

#import "EMMoles.h"
#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) NSMutableArray *moles;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.moles = [NSMutableArray array];
}



-(void)createMoleAtLocation:(CGPoint)location
{
    EMMoles *mole= [[EMMoles alloc] initWithFrame:CGRectMake(0.0, 0.0, 50.0, 50.0)];
    mole.center = location;
    mole.backgroundColor = [UIColor redColor];
    [self.view addSubview:mole];
    [self.moles addObject:mole];
}

- (IBAction)tap:(UITapGestureRecognizer *)sender
{
    CGPoint location = [sender locationInView:self.view];
    [self createMoleAtLocation:location];
}


@end
