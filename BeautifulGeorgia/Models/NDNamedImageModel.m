//
//  NDNamedImage.m
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImageModel.h"

@interface NDNamedImageModel ()

@property (strong, nonatomic, readwrite) NSString *name;
@property (strong, nonatomic, readwrite) UIImage *image;

@end

@implementation NDNamedImageModel

#warning + (id)imageWithName:(UIImage *)image withName:(NSString *)name {
+ (id)imageWithName:(UIImage*)image withName:(NSString *)name {
#warning     NDNamedImageModel *obj = [[NDNamedImageModel alloc] init];
    NDNamedImageModel* obj = [[NDNamedImageModel alloc] init];
    if (obj) {
        obj.name = name;
        obj.image = image;
        
    }
    return obj;
}

@end
