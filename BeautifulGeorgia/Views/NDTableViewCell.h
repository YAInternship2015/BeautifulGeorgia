//
//  NDTableViewCell.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/21/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NDNamedImageModel;

@interface NDTableViewCell : UITableViewCell

- (void)fill:(NDNamedImageModel *)model;

@end
