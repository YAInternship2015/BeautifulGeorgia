//
//  NDAddItemViewController.m
//  BeautifulGeorgia
//
//  Created by Nadiia Dovbysh on 8/26/15.
//  Copyright (c) 2015 Hope. All rights reserved.
//

#import "NDAddItemViewController.h"
#import "UIViewController+NDErrorDisplaying.h"
#import "NDDataSource.h"
#import "NDDataValidator.h"
#import "NDNamedImageFactory.h"

@interface NDAddItemViewController ()

@property (nonatomic, weak) IBOutlet UITextField *titleTextField;

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
#warning текст "Error" надо вынести в localizable.strings. Вообще все тексты, которые создаются в коде, и которые увидит юзер в UI, необходимо помещать в этот файл
        [self showAlert:@"Error" text:[NSString stringWithFormat:@"%@ %@", [error localizedFailureReason], [error localizedRecoverySuggestion]]];
    } else {
        NDDataSource *dataSource = [[NDDataSource alloc] init];
        NSError *error = nil;
        [dataSource saveNamedImageToPlist:[NDNamedImageFactory namedImageObjectWithImage:nil name:title] error:&error];
        if (error) {
            [self showAlert:@"Error" text:[error localizedDescription]];
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
