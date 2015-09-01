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

- (void) reloadData;

- (NSArray*) selectedRowTitles;

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

- (NSInteger) numberOfColumnsInInputView:(ZHNInputViewPicker*)inputView;
- (NSInteger) inputView:(ZHNInputViewPicker*)inputView
   numberOfRowsInColumn:(NSInteger)columnNumber;
- (NSString*) inputView:(ZHNInputViewPicker*)inputView
            titleForRow:(NSInteger)rowIndex
              forColumn:(NSInteger)columnIndex;

@end