//
//  ZHNAccessoryViewPicker.h
//  Zhelezo
//
//  Created by Zhn on 23/08/2015.
//  Copyright (c) 2015 Zhn. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZHNInputViewPickerDelegate;
@protocol ZHNInputViewPickerDataSource;


@interface ZHNInputViewPicker : UIView

/**
 Call reloadAllComponents method in UIPickerView and reconfigure button
 */
- (void) reloadData;

/**
 Return array of string titles rows in UIPickerView
 */
- (NSArray*) selectedRowTitles;

/**
 Selection.
 */
- (void) selectRow:(NSInteger)rowIndex inColumn:(NSInteger)columnIndex animated:(BOOL)animated;

@property (nonatomic, weak) id<ZHNInputViewPickerDelegate> delegate;
@property (nonatomic, weak) id<ZHNInputViewPickerDataSource> dataSource;

@end


@protocol ZHNInputViewPickerDelegate <NSObject>

- (void) inputView:(ZHNInputViewPicker*)inputView
      didSelectRow:(NSInteger)rowIndex
        withColumn:(NSInteger)columnIndex
         withTitle:(NSString*)title;
- (void) didCompleteInputView:(ZHNInputViewPicker*)inputView;

@end


@protocol ZHNInputViewPickerDataSource <NSObject>

- (NSInteger) numberOfColumnsForInputView:(ZHNInputViewPicker*)inputView;
- (NSInteger) inputViewPicker:(ZHNInputViewPicker*)inputView
         numberOfRowsInColumn:(NSInteger)columnIndex;
- (NSString*) inputViewPicker:(ZHNInputViewPicker*)inputView
                  titleForRow:(NSInteger)rowIndex
                    forColumn:(NSInteger)columnIndex;

@optional
- (CGFloat) inputViewPicker:(ZHNInputViewPicker*)inputView
             widthForColumn:(NSInteger)columnIndex;
- (NSString*) titleForButtonDoneInInputViewPicker:(ZHNInputViewPicker*)inputView;

@end