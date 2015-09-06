//
//  NDNamedImageFactory.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDNamedImageFactory.h"
#import "NDNamedImageModel.h"

@implementation NDNamedImageFactory

+ (NDNamedImageModel *)namedImageObjectWithImage:(UIImage *)image name:(NSString *)name {
    if (!image) {
        image = [UIImage imageNamed:@"no_image"];
        image.accessibilityIdentifier = @"no_image";
    }
    return [NDNamedImageModel imageWithName:image imageName:name];
}

@end
