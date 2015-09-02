# ZHNInputViewPicker
Wrapper for UIPickerView which allow use it as input view

## Podfile

```ruby
platform :ios, '7.0'
pod "ZHNInputViewPicker"
```

## Usage

```objc
@property (nonatomic, strong) ZHNInputViewPicker* dataPicker;

self.dataPicker = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([ZHNInputViewPicker class]) owner:self options:nil] firstObject];
self.dataPicker.delegate = self;
self.dataPicker.dataSource = self;
[self.dataPicker reloadData];


#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    textField.inputView = self.dataPicker;
    self.dataPicker.sender = textField;
    return YES;
}


#pragma mark - ZHNInputViewPickerDelegate, ZHNInputViewPickerDataSource

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

```