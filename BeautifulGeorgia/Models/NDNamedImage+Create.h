//
//  NDNamedImage+Create.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImage.h"

@interface NDNamedImage (Create)

+ (NDNamedImage *)namedImageWithName:(NSString *)name image:(UIImage *)image;

@end
