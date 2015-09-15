//
//  NDNamedImage+Create.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDNamedImage+Create.h"

@implementation NDNamedImage (Create)

#warning в идеале нужно прокидывать в фабрику и, соответственно, в модель контекст, в котором нужно создавать модель
+ (NDNamedImage *)namedImageWithName:(NSString *)name image:(UIImage *)image {
    NDNamedImage *namedImage = [NSEntityDescription
                                insertNewObjectForEntityForName:@"NDNamedImage"
                                inManagedObjectContext:AppDelegate.managedObjectContext];
    namedImage.name = name;
    namedImage.image = UIImagePNGRepresentation(image);
    return namedImage;
}

@end
