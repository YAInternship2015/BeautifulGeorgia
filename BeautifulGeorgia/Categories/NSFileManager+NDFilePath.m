//
//  NSFileManager+NDFilePath.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/29/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NSFileManager+NDFilePath.h"

@implementation NSFileManager (NDFilePath)

+ (NSString *)filePath:(NSString *)name type:(NSString *)type {
    NSError *error;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *plistPath = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.%@", name, type]];
    if (![[self defaultManager] fileExistsAtPath: plistPath])
    {
        NSString *bundle = [[NSBundle mainBundle] pathForResource:name ofType:type];
        [[self defaultManager] copyItemAtPath:bundle toPath:plistPath error:&error];
    }
    return plistPath;
}

@end
