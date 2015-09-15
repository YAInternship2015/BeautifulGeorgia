//
//  NDNamedImageFactory.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImageFactory.h"
#import "UIImage+NDDefaultImage.h"
#import "NDNamedImage.h"
#import "NDNamedImage+Create.h"

@implementation NDNamedImageFactory

+ (NDNamedImage *)namedImageObjectWithName:(NSString *)name
                                     image:(UIImage *)image
                    inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    if (!image) {
        image = [UIImage defaultImage];
    }
    return [NDNamedImage namedImageWithName:name
                                      image:image
                     inManagedObjectContext:managedObjectContext];
}

@end
