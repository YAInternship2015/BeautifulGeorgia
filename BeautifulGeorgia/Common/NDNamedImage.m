//
//  NDNamedImage.m
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImage.h"

@implementation NDNamedImage

+ (id) imageWithName: (UIImage*)image withName:(NSString *)name {
    NDNamedImage* obj = [[NDNamedImage alloc] init];
    if (obj) {
        obj.name = name;
        obj.image = image;
    }
    return obj;
}

@end
