//
//  ViewController.m
//  Button Fun
//
//  Created by Ujwalashish on 8/19/15.
//  Copyright (c) 2015 Ujwalashish. All rights reserved.
//

#import "ViewController.h"


static const CGSize SQUARE_SIZE = { 40, 40 };

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //add views
    [self createAndAddSquares];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createAndAddSquares {
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    for(int x = 0; x <= w; x+= 40) {
        for(int y = 0; y <= h; y+= 40) {
            CGPoint point = CGPointMake(x, y);
            [self addSquare: point];
        }
    }
}

- (void) updateSquares {
    while ([self.view.subviews count] > 0) {
        UIView *v = [self.view.subviews objectAtIndex:0];
        [v removeFromSuperview];
    }
    [self createAndAddSquares];
}

- (void) addSquare : (CGPoint) point {
    CGRect frame;
    frame.origin = point;
    frame.size = SQUARE_SIZE;
    UIView *squareView = [[UIView alloc] initWithFrame:frame];
    squareView.backgroundColor = [self randomColor];
    [self.view addSubview:squareView];
    squareView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (UIColor *) randomColor {
    switch (arc4random()%5) {
        case 0: return [UIColor blueColor];
        case 1: return [UIColor greenColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

- (IBAction)tapGesture:(UITapGestureRecognizer*) sender {
    if(sender.numberOfTapsRequired == 1) {
        CGPoint location = [sender locationInView:self.view];
        CALayer *hitLayer = [self.view.layer hitTest: location];
        
        //check if dat layer is one of the squareview
        for(UIView *subview in self.view.subviews) {
            if([subview isKindOfClass:[UIView class]])
            {
                if(hitLayer == subview.layer) {
                    [subview setBackgroundColor:[UIColor whiteColor]];
                    break;
                }
            }
        }
    }
}

-(void)updateViewConstraints {
    [super updateViewConstraints];
    [self updateSquares];
}

@end
