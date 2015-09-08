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
#import "NSFileManager+NDFilePath.h"
#import "NDNotification.h"

@interface NDDataSource ()

#warning id<NDDataSourceDelegate>
@property (nonatomic, weak) id <NDDataSourceDelegate> sourceDelegate;
@property (nonatomic, strong) NSMutableArray *objects;

@end

@implementation NDDataSource

- (instancetype)initWithDelegate:(id)delegate {
    self = [super init];
    if (self) {
        self.objects =  [NSMutableArray arrayWithArray:[self namedImages]];
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
    self.objects = [NSMutableArray arrayWithArray:[self namedImages]];
    [self.sourceDelegate dataWasChanged];
}


- (NSArray *)namedImages {
    NSPropertyListFormat format;
    NSString *plistPath = [NDDataSource plistPath];
    NSData *plistData = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSError *theError = nil;
    NSArray *temp = (NSArray *) [NSPropertyListSerialization propertyListWithData:plistData options:0 format:&format error:&theError];
    NSMutableArray *resultArray = [NSMutableArray array];
    if (temp) {
        for (NSDictionary *dictionary in temp) {
            NSString *imageName = [dictionary objectForKey:@"imageName"];
            NSString *title = [dictionary objectForKey:@"title"];
            NDNamedImageModel *model = [NDNamedImageFactory namedImageObjectWithImage:[UIImage imageNamed:imageName] name:title];
            [resultArray addObject:model];
        }
    }
    return resultArray;
}

- (NSUInteger)numberOfObjects {
    return [self.objects count];
}

- (id)objectAtIndex:(NSUInteger)index{
    return [self.objects objectAtIndex:index];
}

- (void)saveNamedImage:(NDNamedImageModel *)model error:(NSError **)error {
#warning преобразование модели в NSDictionary должно быть реализовано в категории модели в методе, скажем, dictionaryRepresentation
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:
                                model.image.accessibilityIdentifier, @"imageName",
                                model.name, @"title", nil];
    
    NSString *plistPath = [NDDataSource plistPath];
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

+ (NSString *)plistPath {
    return [NSFileManager filePath:@"Data" type:@"plist"];;
}

@end
