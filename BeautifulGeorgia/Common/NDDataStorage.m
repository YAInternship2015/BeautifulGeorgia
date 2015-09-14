//
//  NDDataStorage.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDDataStorage.h"
#import "NDNamedImage.h"
#import <CoreData/NSFetchedResultsController.h>
#import "UIViewController+NDAlertDisplaying.h"

@interface NDDataStorage ()

@property (nonatomic, weak) id<NSFetchedResultsControllerDelegate> delegate;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;

@end

@implementation NDDataStorage

- (instancetype)initWithFetchedResultsControllerDelegate:(id)delegate {
    self = [super init];
    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (NSUInteger)numberOfObjects {
    id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:0];
    return [sectionInfo numberOfObjects];
}

- (id)objectAtIndex:(NSIndexPath *)indexPath {
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

- (void)saveNewObject:(NDNamedImage *)namedImage error:(NSError *)error {
    [AppDelegate.managedObjectContext save:&error];
}

- (void)removeObject:(NDNamedImage *)namedImage error:(NSError *)error {
    [AppDelegate.managedObjectContext deleteObject:namedImage];
    [AppDelegate.managedObjectContext save:&error];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"NDNamedImage" inManagedObjectContext:AppDelegate.managedObjectContext];
    [fetchRequest setEntity:entity];
    [fetchRequest setFetchBatchSize:20];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"name"
                                        ascending:YES
                                        selector:@selector(localizedStandardCompare:)];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:AppDelegate.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    aFetchedResultsController.delegate = self.delegate;
    self.fetchedResultsController = aFetchedResultsController;
    
    NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"%@, %@", error, [error userInfo]);
    }
    
    return _fetchedResultsController;
}

@end
