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


- (IBAction)selectRowHandler:(id)sender
{
    [self.dataPicker selectRow:rand()%5 inColumn:rand()%3 animated:YES];
    NSLog(@"0:%@", @([self.dataPicker selectedRowAtColumn:0]));
    NSLog(@"1:%@", @([self.dataPicker selectedRowAtColumn:1]));
    NSLog(@"2:%@", @([self.dataPicker selectedRowAtColumn:2]));
}


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.inputView = self.dataPicker;
    self.dataPicker.sender = textField;
    return YES;
}




#pragma mark - ZHNInputViewPickerDelegate, ZHNInputViewPickerDataSource

- (CGFloat)inputViewPicker:(ZHNInputViewPicker *)inputView
            widthForColumn:(NSInteger)columnIndex
{
    return 70;
}

- (void)didCompleteInputViewPicker:(ZHNInputViewPicker *)inputView
{
    [self.view endEditing:YES];
}

- (void) inputViewPicker:(ZHNInputViewPicker*)inputView
            didSelectRow:(NSInteger)rowIndex
              withColumn:(NSInteger)columnIndex
               withTitle:(NSString*)title
{
    NSArray* _arr = [inputView selectedRowTitles];
    if ([inputView.sender isKindOfClass:[UITextField class]])
        ((UITextField*)inputView.sender).text = [_arr componentsJoinedByString:@", "];
}

- (NSInteger) numberOfColumnsForInputViewPicker:(ZHNInputViewPicker*)inputView
{
    return 3;
}

- (NSInteger) inputViewPicker:(ZHNInputViewPicker*)inputView
         numberOfRowsInColumn:(NSInteger)columnNumber
{
    return 5;
}

- (NSString*) inputViewPicker:(ZHNInputViewPicker*)inputView
                  titleForRow:(NSInteger)rowIndex
                    forColumn:(NSInteger)columnIndex
{
    return [NSString stringWithFormat:@"r%@ c%@", @(rowIndex), @(columnIndex)];
}


@end
