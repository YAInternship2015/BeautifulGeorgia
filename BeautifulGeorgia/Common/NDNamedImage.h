//
//  NDNamedImage.h
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface NDNamedImage : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) UIImage *image;

+ (id) imageWithName: (UIImage*)image withName:(NSString *)name;

@end