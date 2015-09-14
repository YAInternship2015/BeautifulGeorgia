//
//  NDAppDelegate+MOC.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDAppDelegate+MOC.h"
#import <CoreData/CoreData.h>

@implementation NDAppDelegate (MOC)

#pragma mark - Core Data Stack

- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectContext *)createMainQueueManagedObjectContext {
    NSManagedObjectContext *managedObjectContext = [[NSManagedObjectContext alloc] init];
    [managedObjectContext setPersistentStoreCoordinator:[self createPersistentStoreCoordinator]];
    return managedObjectContext;
}

- (NSPersistentStoreCoordinator *)createPersistentStoreCoordinator {
    NSManagedObjectModel *managedObjectModel = [self createManagedObjectModel];
    NSPersistentStoreCoordinator *persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"BeautifulGeorgia.sqlite"];
    [self replaceDatabaseByUrl:storeURL];
    
    NSError *error = nil;
    
    if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = (NSLocalizedString(@"FailInitAppDataKey", nil));
        dict[NSLocalizedFailureReasonErrorKey] = (NSLocalizedString(@"FailCreateAppDataKey", nil));
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"com.beautifulGeorgia" code:9999 userInfo:dict];
        
        NSLog(@"%@, %@", error, [error userInfo]);
    }
    return persistentStoreCoordinator;
}

- (NSManagedObjectModel *)createManagedObjectModel {
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"BeautifulGeorgia" withExtension:@"momd"];
    NSManagedObjectModel *managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return managedObjectModel;
}

- (void)replaceDatabaseByUrl:(NSURL *)storeURL {
    NSString *dbDocumentsPath = [storeURL path];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath:dbDocumentsPath]) {
        NSString *dbBundlePath = [[NSBundle mainBundle] pathForResource:@"BeautifulGeorgia" ofType:@"sqlite"];
        [fileManager copyItemAtPath:dbBundlePath toPath:dbDocumentsPath error:nil];
    }
}

#pragma mark - Core Data Saving Support

- (void)saveContext:(NSManagedObjectContext *)managedObjectContext {
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            NSLog(@"%@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
