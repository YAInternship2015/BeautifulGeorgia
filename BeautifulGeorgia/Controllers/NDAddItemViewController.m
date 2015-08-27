//
//  NDAddItemViewController.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/26/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDAddItemViewController.h"

@interface NDAddItemViewController ()

- (IBAction)save:(UIButton *)sender;
- (IBAction)cancel:(UIButton *)sender;


@end

@implementation NDAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)save:(UIButton *)sender {
    
}

- (IBAction)cancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
