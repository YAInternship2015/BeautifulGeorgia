//
//  NDCollectionViewCell.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/23/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NDNamedImage;

@interface NDCollectionViewCell : UICollectionViewCell

- (void)fillWithNamedImage:(NDNamedImage *)model;

@end
