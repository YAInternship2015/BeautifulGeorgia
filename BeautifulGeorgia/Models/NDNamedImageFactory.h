//
//  NDNamedImageFactory.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIImage;
@class NDNamedImage;

@interface NDNamedImageFactory : NSObject

+ (NDNamedImage *)namedImageObjectWithName:(NSString *)name image:(UIImage *)image;

@end
