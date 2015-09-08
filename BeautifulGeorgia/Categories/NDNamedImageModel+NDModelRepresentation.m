//
//  NDNamedImageModel+NDModelRepresentation.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/8/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDNamedImageModel+NDModelRepresentation.h"

@implementation NDNamedImageModel (NDModelRepresentation)

+ (NSDictionary *)dictionaryRepresentation:(NDNamedImageModel *)model {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                model.image.accessibilityIdentifier, @"imageName",
                                model.name, @"title", nil];
    return dictionary;
}

@end
