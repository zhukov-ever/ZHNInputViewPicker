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

- (NSInteger) numberOfColumnsForInputView:(ZHNInputViewPicker*)inputView
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