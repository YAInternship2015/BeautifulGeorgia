//
//  NSFileManager+NDFilePath.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/29/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (NDFilePath)

+ (NSString *)filePath:(NSString *)name type:(NSString *)type;

@end
