//
//  UIImage+NDDefaultImage.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/8/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "UIImage+NDDefaultImage.h"

@implementation UIImage (NDDefaultImage)

+ (UIImage *)defaultImage {
    UIImage *image = [UIImage imageNamed:@"no_image"];
    image.accessibilityIdentifier = @"no_image";
    return image;
}

@end
