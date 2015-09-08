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
#import "UIImage+NDDefaultImage.h"

@implementation NDNamedImageFactory

+ (NDNamedImageModel *)namedImageObjectWithImage:(UIImage *)image name:(NSString *)name {
    if (!image) {
        image = [UIImage defaultImage];
    }
    return [NDNamedImageModel imageWithName:image imageName:name];
}

@end
