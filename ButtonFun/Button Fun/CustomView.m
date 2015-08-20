//
//  CustomView.m
//  Button Fun
//
//  Created by Ujwalashish on 8/20/15.
//  Copyright (c) 2015 Ujwalashish. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setProperties {
    self.backgroundColor = [self randomColor];
    self.translatesAutoresizingMaskIntoConstraints = NO;
}

- (void) changeColor {
    self.backgroundColor = [self randomColor];
}

- (UIColor *) randomColor {
    switch (arc4random()%13) {
        case 0: return  [UIColor darkGrayColor];
        case 1: return  [UIColor lightGrayColor];
        case 2: return  [UIColor whiteColor];
        case 3: return  [UIColor grayColor];
        case 4: return  [UIColor redColor];
        case 5: return  [UIColor greenColor];
        case 6: return  [UIColor blueColor];
        case 7: return  [UIColor cyanColor];
        case 8: return  [UIColor yellowColor];
        case 9: return  [UIColor magentaColor];
        case 10: return [UIColor orangeColor];
        case 11: return [UIColor purpleColor];
        case 12: return [UIColor brownColor];
    }
    return [UIColor blackColor];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
