//
//  AppDelegate.m
//  NDYalantisTest1
//
//  Created by Nadiia Dovbysh on 8/1/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDAppDelegate.h"
#import "NDAppDelegate+MOC.h"

@interface NDAppDelegate ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;

@end

@implementation NDAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.managedObjectContext = [self createMainQueueManagedObjectContext];
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext:self.managedObjectContext];
}

@end
