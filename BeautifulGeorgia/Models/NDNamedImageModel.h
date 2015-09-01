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

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) UIImage *image;

#warning вместо типа id лучше возвращать тип instancetype. Также имя метода мне не нравится. Следует избегать использования предлогов во втором, третьем и т.д. параметрах. Лучше как-то так + namedImageWithName:imageName:
+ (id)imageWithName:(UIImage *)image withName:(NSString *)name;

@end