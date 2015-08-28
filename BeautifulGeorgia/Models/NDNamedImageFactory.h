//
//  NDNamedImageFactory.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NDNamedImageModel;
@class UIImage;

@interface NDNamedImageFactory : NSObject

#warning неудачное имя для метода. лучше namedImageObjectWithImage:name:
+ (NDNamedImageModel *)createObject:(UIImage *)image name:(NSString *)name;

@end
