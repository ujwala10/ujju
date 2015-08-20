//
//  ViewController.m
//  Button Fun
//
//  Created by Ujwalashish on 8/19/15.
//  Copyright (c) 2015 Ujwalashish. All rights reserved.
//


#import "ViewController.h"
#import "CustomView.h"

static const CGSize SQUARE_SIZE = { 40.0f, 40.0f };

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
    CGFloat w = self.view.frame.size.width;
    CGFloat h = self.view.frame.size.height;
    
    for(CGFloat x = 0.0f; x <= w; x+= 40.0f) {
        for(CGFloat y = 0.0f; y <= h; y+= 40.0f) {
            CGPoint point = CGPointMake(x, y);
            [self addSquare: point];
        }
    }
}

- (void) addSquare : (CGPoint) point {
    CGRect frame;
    frame.origin = point;
    frame.size = SQUARE_SIZE;
    CustomView *squareView = [[CustomView alloc] initWithFrame:frame];
    [squareView setProperties];
    [self.view addSubview:squareView];
}

- (void) updateSquares {
    while ([self.view.subviews count] > 0) {
        UIView *subview = [self.view.subviews objectAtIndex:0];
        if(subview)
            [subview removeFromSuperview];
    }
    [self createAndAddSquares];
}

- (IBAction)tapGesture:(UITapGestureRecognizer*) sender {
    if(sender.numberOfTapsRequired == 1) {
        CGPoint location = [sender locationInView:self.view];
        CALayer *hitLayer = [self.view.layer hitTest: location];
        
        //check if dat layer is one of the squareview
        for(id subview in self.view.subviews) {
            if([subview isKindOfClass:[CustomView class]])
            {
                CustomView *view = (CustomView*) subview;
                if(view && hitLayer == view.layer) {
                    [view changeColor];
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
