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
 Helps return selected value back. Have to be set manually.
 */
@property (nonatomic, weak) id sender;

@property (nonatomic, weak) id<ZHNInputViewPickerDelegate> delegate;
@property (nonatomic, weak) id<ZHNInputViewPickerDataSource> dataSource;

/**
 Call reloadAllComponents method in UIPickerView and reconfigure button
 */
- (void) reloadData;

/**
 Return array of string titles rows in UIPickerView
 */
- (NSArray*) selectedRowTitles;

/**
 Selection. For preventing recursive calls 
 method -inputViewPicker:didSelectRow:withColumn:withTitle: will not be executed
 */
- (void) selectRow:(NSInteger)rowIndex
          inColumn:(NSInteger)columnIndex
          animated:(BOOL)animated;

@end


@protocol ZHNInputViewPickerDelegate <NSObject>

- (void) inputViewPicker:(ZHNInputViewPicker*)inputView
            didSelectRow:(NSInteger)rowIndex
              withColumn:(NSInteger)columnIndex
               withTitle:(NSString*)title;
- (void) didCompleteInputViewPicker:(ZHNInputViewPicker*)inputView;

@end


@protocol ZHNInputViewPickerDataSource <NSObject>

- (NSInteger) numberOfColumnsForInputViewPicker:(ZHNInputViewPicker*)inputView;
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