//
//  NDNamedImageFactory.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

//controllers
#import "NDNamedImageFactory.h"

//models
#import "NDNamedImageModel.h"

@implementation NDNamedImageFactory

+ (NDNamedImageModel *)createObject:(UIImage *)image name:(NSString *)name {
    return [NDNamedImageModel imageWithName:image withName:name];
}

@end