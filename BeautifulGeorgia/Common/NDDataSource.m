//
//  NDDataSource.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/21/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NDDataSource.h"
#import "NDNamedImageModel.h"
#import "NDNamedImageFactory.h"

NSString *const NDDataSourceFileContentDidChangeNotification = @"NDDataSourceFileContentDidChangeNotification";

@interface NDDataSource ()
@property (strong, nonatomic) NSMutableArray *array;
@end

@implementation NDDataSource

- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        self.array =  [NSMutableArray arrayWithArray:[NDDataSource getNamedImagesFromPlist]];
        self.sourceDelegate = delegate;
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reloadData:)
                                                     name:NDDataSourceFileContentDidChangeNotification
                                                   object:nil];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)reloadData:(NSNotification *)notification {
    [self.array addObject:[notification object]];
    [self.sourceDelegate dataWasChanged];
}

+ (NSArray *)getNamedImagesFromPlist {
    NSPropertyListFormat format;
    NSString *plistPath = [self getPlistPath];
    NSData *plistData = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSError *theError = nil;
    NSArray *temp = (NSArray *) [NSPropertyListSerialization propertyListWithData:plistData options:0 format:&format error:&theError];
    NSMutableArray *resultArray = [NSMutableArray array];
    if (temp) {
        for (NSDictionary *dictionary in temp) {
            NSString *imageName = [dictionary objectForKey:@"imageName"];
            NSString *title = [dictionary objectForKey:@"title"];
            NDNamedImageModel *model = [NDNamedImageFactory createObject:[UIImage imageNamed:imageName] name:title];
            [resultArray addObject:model];
        }
    }
    return resultArray;
}

- (NSArray *)getNamedImages {
    return self.array;
}

- (void)putNamedImagesFromPlist:(NDNamedImageModel *)model error:(NSError **)error {
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                model.image.accessibilityIdentifier, @"imageName",
                                model.name, @"title", nil];
    
    NSString *plistPath = [NDDataSource getPlistPath];
    NSMutableArray *array = [NSMutableArray arrayWithContentsOfFile:plistPath];
    [array addObject:dictionary];
    
    NSError *theError = nil;
    NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:array format:NSPropertyListBinaryFormat_v1_0 options:0 error:&theError];
    
    if(plistData) {
        theError = nil;
        [plistData writeToFile:plistPath options:0 error:&theError];
        if (!theError) {
            [[NSNotificationCenter defaultCenter] postNotificationName:NDDataSourceFileContentDidChangeNotification object:model];
        } else {
            *error = theError;
        }
    }
    else {
        *error = theError;
    }
}

+ (NSString *)getPlistPath {

    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:@"Data.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath: plistPath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
        [[NSFileManager defaultManager] copyItemAtPath:bundle toPath:plistPath error:&error];
    }
    return plistPath;
}

@end
