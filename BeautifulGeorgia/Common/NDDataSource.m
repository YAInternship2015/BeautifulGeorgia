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


@implementation NDDataSource

+ (NSArray *)getNamedImages {
    return [self loadDataFromPlist];
}

+ (NSArray *)loadDataFromPlist {
    NSMutableArray *resultArray = [NSMutableArray array];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Data" ofType:@"plist"];
    NSDictionary *baseDictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    
    for (NSInteger i = 0; i < [baseDictionary count]; i ++) {
        NSString *baseKey = [NSString stringWithFormat:@"Item %d", i];
        NSDictionary *dictionary = [baseDictionary objectForKey:baseKey];
        NSString *imageName = [dictionary objectForKey:@"imageName"];
        NSString *title = [dictionary objectForKey:@"title"];
        NDNamedImageModel *model = [NDNamedImageModel imageWithName:[UIImage imageNamed:imageName] withName:title];
        [resultArray addObject:model];
    }
    return resultArray;
}

@end
