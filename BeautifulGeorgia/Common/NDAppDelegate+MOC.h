//
//  NDAppDelegate+MOC.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDAppDelegate.h"

@interface NDAppDelegate (MOC)

- (NSManagedObjectContext *)mainQueueManagedObjectContext;
- (void)saveContext:(NSManagedObjectContext *)managedObjectContext;

@end
