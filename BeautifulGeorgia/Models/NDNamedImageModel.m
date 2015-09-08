//
//  NDNamedImage.m
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImageModel.h"

@interface NDNamedImageModel ()

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) UIImage *image;

@end

@implementation NDNamedImageModel

+ (instancetype)imageWithName:(UIImage *)image imageName:(NSString *)name {
    NDNamedImageModel *obj = [[NDNamedImageModel alloc] init];
    obj.name = name;
    obj.image = image;
    return obj;
}

@end
