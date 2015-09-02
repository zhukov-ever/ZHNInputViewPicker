//
//  ZHNAccessoryViewPicker.m
//  Zhelezo
//
//  Created by Zhn on 23/08/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import "ZHNInputViewPicker.h"


@interface ZHNInputViewPicker() <UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *buttonDone;
@property (weak, nonatomic) IBOutlet UIPickerView *dataPicker;

@end


@implementation ZHNInputViewPicker

#pragma mark - override

- (void)awakeFromNib
{
    [super awakeFromNib];
    CGRect _rect = self.frame;
    _rect.size.height = 206;
    self.frame = _rect;
    
    self.dataPicker.delegate = self;
    self.dataPicker.dataSource = self;
    
    [self configureButtonDone];
    [self.buttonDone addTarget:self
                        action:@selector(doneHandler:)
              forControlEvents:UIControlEventTouchUpInside];
}




#pragma mark - public

- (void) reloadData
{
    [self configureButtonDone];
    [self.dataPicker reloadAllComponents];
}

- (NSArray*) selectedRowTitles
{
    NSMutableArray* _arrayTitles = [NSMutableArray new];
    NSInteger _columnNumber = [self.dataSource numberOfColumnsInInputView:self];
    
    for (NSInteger i = 0; i < _columnNumber; i++)
    {
        NSInteger _selectedRow = [self.dataPicker selectedRowInComponent:i];
        NSString* _selectedTitle = [self pickerView:self.dataPicker titleForRow:_selectedRow forComponent:i];
        [_arrayTitles addObject:_selectedTitle];
    }
    
    return [NSArray arrayWithArray:_arrayTitles];
}

- (void) selectRow:(NSInteger)rowIndex inColumn:(NSInteger)columnIndex
{
    
}



#pragma mark - private

- (void) configureButtonDone
{
    if ([self.dataSource respondsToSelector:@selector(titleForButtonDoneInInputView:)])
    {
        [self.buttonDone setTitle:[self.dataSource titleForButtonDoneInInputView:self]
                         forState:UIControlStateNormal];
    }
}




#pragma mark - handlers

- (IBAction)doneHandler:(id)sender
{
    [self.delegate didCompleteInputView:self];
}





#pragma mark - UIPickerViewDelegate, UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return [self.dataSource numberOfColumnsInInputView:self];
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.dataSource inputView:self numberOfRowsInColumn:component];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.dataSource inputView:self titleForRow:row forColumn:component];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString* _selectedTitle = [self pickerView:pickerView titleForRow:row forComponent:component];
    [self.delegate inputView:self didSelectRow:row withColumn:component withTitle:_selectedTitle];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    if ([self.dataSource respondsToSelector:@selector(inputView:widthForColumn:)])
        return [self.dataSource inputView:self widthForColumn:component];
    return CGRectGetWidth([UIScreen mainScreen].bounds) / [self.dataSource numberOfColumnsInInputView:self];
}


@end
