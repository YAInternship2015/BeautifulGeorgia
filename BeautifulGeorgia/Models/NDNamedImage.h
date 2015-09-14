//
//  NDNamedImage.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface NDNamedImage : NSManagedObject

@property (nonatomic, retain) NSData *image;
@property (nonatomic, retain) NSString *name;

@end
