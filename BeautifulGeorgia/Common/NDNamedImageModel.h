//
//  NDNamedImage.h
//  TestYalantis1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;

@interface NDNamedImageModel : NSObject

@property (strong, nonatomic, readonly) NSString *name;
@property (strong, nonatomic, readonly) UIImage *image;

+ (id)imageWithName:(UIImage*)image withName:(NSString *)name;

@end