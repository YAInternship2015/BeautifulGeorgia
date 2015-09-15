//
//  NDNamedImage+Create.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImage+Create.h"

@implementation NDNamedImage (Create)

+ (NDNamedImage *)namedImageWithName:(NSString *)name
                               image:(UIImage *)image
              inManagedObjectContext:(NSManagedObjectContext *)managedObjectContext {
    NDNamedImage *namedImage = [NSEntityDescription
                                insertNewObjectForEntityForName:@"NDNamedImage"
                                inManagedObjectContext:managedObjectContext];
    namedImage.name = name;
    namedImage.image = UIImagePNGRepresentation(image);
    return namedImage;
}

@end
