//
//  NDDataStorage.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 9/13/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NDNamedImage;

@interface NDDataStorage : NSObject

- (instancetype)initWithFetchedResultsControllerDelegate:(id)delegate;
- (NSUInteger)numberOfObjects;
- (id)objectAtIndex:(NSIndexPath *)indexPath;
- (void)saveNewObject:(NDNamedImage *)namedImage error:(NSError *)error;
- (void)removeObject:(NDNamedImage *)namedImage error:(NSError *)error;

@end
