//
//  UIViewController+NDErrorDisplaying.h
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/27/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NDErrorDisplaying)

extern NSString *const NDErrorDisplayingDidPressActionNotification;

- (void)showAlert:(NSString *)title
             text:(NSString *)text
       sourceView:(UIView *)sourceView;

@end
