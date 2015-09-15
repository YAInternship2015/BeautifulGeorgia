//
//  NDAppDelegate+MOC.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDAppDelegate.h"

@interface NDAppDelegate (MOC)

#warning если это геттер, то стоило его назвать просто mainQueueManagedObjectContext
- (NSManagedObjectContext *)createMainQueueManagedObjectContext;
- (void)saveContext:(NSManagedObjectContext *)managedObjectContext;

@end
