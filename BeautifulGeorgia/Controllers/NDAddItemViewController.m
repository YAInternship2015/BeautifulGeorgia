//
//  NDAddItemViewController.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/26/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

//controllers
#import "NDAddItemViewController.h"

//categories
#import "UIViewController+NDErrorDisplaying.h"

//sources
#import "NDDataSource.h"

//other
#import "NDDataValidator.h"
#import "NDNamedImageFactory.h"

@interface NDAddItemViewController ()

@property (weak, nonatomic) IBOutlet UIButton *saveBtn;
- (IBAction)save:(UIButton *)sender;
- (IBAction)cancel:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;

@end

@implementation NDAddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.titleTextField becomeFirstResponder];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(setFocus:)
                                                 name:NDErrorDisplayingDidPressActionNotification
                                               object:nil];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)setFocus:(NSNotification *)notification {
    [self.titleTextField becomeFirstResponder];
}

#pragma mark - Actions

- (IBAction)save:(UIButton *)sender {
    [self saveNewItem];
}

- (IBAction)cancel:(UIButton *)sender {
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)saveNewItem {
    [self.view endEditing:YES];
    NSError *error = nil;
    NSString *title = self.titleTextField.text;
    [NDDataValidator isValidModelTitle:title error:&error];
    
    if (error) {
        [self showAlert:nil text:[NSString stringWithFormat:@"%@ %@", [error localizedFailureReason], [error localizedRecoverySuggestion]] sourceView:self.titleTextField];
    } else {
        UIImage *image = [UIImage imageNamed:@"no_image"];
        image.accessibilityIdentifier = @"no_image";
        NDDataSource *dataSource = [[NDDataSource alloc] init];
        NSError *error = nil;
        [dataSource putNamedImagesFromPlist:[NDNamedImageFactory createObject:image name:title] error:&error];
        if (error) {
            [self showAlert:@"Error" text:[error localizedDescription] sourceView:self.saveBtn];
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self saveNewItem];
    return YES;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return [NDDataValidator isValidModelTitle:textField.text.length range:range replacementString:string];
}

@end
