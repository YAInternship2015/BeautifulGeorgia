//
//  NDNamedImage.m
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImageModel.h"

@interface NDNamedImageModel ()

@property (nonatomic, strong, readwrite) NSString *name;
@property (nonatomic, strong, readwrite) UIImage *image;

@end

@implementation NDNamedImageModel

+ (id)imageWithName:(UIImage *)image withName:(NSString *)name {
    NDNamedImageModel *obj = [[NDNamedImageModel alloc] init];
    if (obj) {
        obj.name = name;
        obj.image = image;
        
    }
    return obj;
}

@end
