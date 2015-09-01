Pod::Spec.new do |s|
  s.name                      = "ZHNInputViewPicker"
  s.version                   = "0.0.1"
  s.summary                   = "Wrapper for UIPickerView which allow use it as input view."
  s.homepage                  = "https://github.com/zhukov-ever/ZHNInputViewPicker"
  s.license                   = { :type => "MIT", :file => "LICENSE" }
  s.author                    = { "Zhn" => "zhukov.ever@gmail.com" }
  s.platform                  = :ios, '7.0'
  s.source                    = { :git => "https://github.com/zhukov-ever/ZHNInputViewPicker.git", :tag => s.version.to_s }
  s.source_files              = "Classes", "Classes/**/*.{h,m}"
  s.public_header_files       = "Classes/**/*.h"
  s.resources                 = "Classes/**/*.xib"
  s.framework                 = "Foundation"
  s.requires_arc              = true
end
