//
//  ViewController.m
//  ZHNInputViewPicker
//
//  Created by Zhn on 1/09/2015.
//  Copyright (c) 2015 zhn. All rights reserved.
//

#import "ViewController.h"
#import <ZHNInputViewPicker/ZHNInputViewPicker.h>

@interface ViewController () <ZHNInputViewPickerDelegate, ZHNInputViewPickerDataSource, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (nonatomic, strong) ZHNInputViewPicker* dataPicker;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    
    self.dataPicker = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ZHNInputViewPicker class]) owner:self options:nil] firstObject];
    self.dataPicker.delegate = self;
    self.dataPicker.dataSource = self;
    [self.dataPicker reloadData];
}




#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.inputView = self.dataPicker;
    return YES;
}




#pragma mark - ZHNInputViewPickerDelegate, ZHNInputViewPickerDataSource

- (void)didCompleteInputView:(ZHNInputViewPicker *)inputView
{
    [self.view endEditing:YES];
}

- (void) inputView:(ZHNInputViewPicker*)inputView
      didSelectRow:(NSInteger)rowIndex
        withColumn:(NSInteger)columnIndex
         withTitle:(NSString*)title
{
    NSArray* _arr = [inputView selectedRowTitles];
    self.textField.text = [_arr componentsJoinedByString:@", "];
}

- (NSInteger) numberOfColumnsInInputView:(ZHNInputViewPicker*)inputView
{
    return 3;
}

- (NSInteger) inputView:(ZHNInputViewPicker*)inputView
   numberOfRowsInColumn:(NSInteger)columnNumber
{
    return 5;
}

- (NSString*) inputView:(ZHNInputViewPicker*)inputView
            titleForRow:(NSInteger)rowIndex
              forColumn:(NSInteger)columnIndex
{
    return [NSString stringWithFormat:@"r%@ c%@", @(rowIndex), @(columnIndex)];
}


@end
