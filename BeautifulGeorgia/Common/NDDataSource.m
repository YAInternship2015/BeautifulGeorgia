//
//  NDDataSource.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/21/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDDataSource.h"
#import "NDNamedImageModel.h"


@implementation NDDataSource

+ (NSArray *) getNamedImages {
    NSArray *array = [NSArray arrayWithObjects:
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"1"] withName:@"Borjomi"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"2"] withName:@"Mountain roads"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"3"] withName:@"Wild nature"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"4"] withName:@"Mountain village"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"5"] withName:@"Wild wood"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"6"] withName:@"Mountains"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"7"] withName:@"Mtirala national park"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"8"] withName:@"Mountain sky"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"9"] withName:@"Sunshine"],
                   [NDNamedImageModel imageWithName:[UIImage imageNamed:@"10"] withName:@"Waterfall"], nil];
    return array;
}

@end
