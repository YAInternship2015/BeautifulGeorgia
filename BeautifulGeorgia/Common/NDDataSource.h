//
//  NDDataSource.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/21/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NDNamedImageModel;

extern NSString *const NDDataSourceFileContentDidChangeNotification;

@protocol NDDataSourceDelegate <NSObject>
- (void)dataWasChanged;
@end

@interface NDDataSource : NSObject
#warning зачем это свойтсво в *.h файле? Также, оно должнл быть (nonatomic, weak)
@property (nonatomic, assign) id <NDDataSourceDelegate> sourceDelegate;
- (instancetype)initWithDelegate:(id)delegate;

#warning get в имени геттера не нужен
- (NSArray *)getNamedImages;
- (void)putNamedImagesFromPlist:(NDNamedImageModel *)model error:(NSError **)error;

@end
