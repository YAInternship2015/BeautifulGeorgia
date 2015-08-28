//
//  NDDataValidator.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NDDataValidator : NSObject

+ (BOOL)isValidModelTitle:(NSString *)title error:(NSError **)error;
+ (BOOL)isValidModelTitle:(NSUInteger)length
                    range:(NSRange)range
        replacementString:(NSString *)string;

@end
