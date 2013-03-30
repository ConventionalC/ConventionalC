Pod::Spec.new do |s|
  s.name         = "ConventionalC"
  s.version      = "0.1.0"
  s.summary      = "Cocoapod and static library to provide defaults and convenience methods for terser Objective-C."
  s.homepage     = "http://github.com/ConventionalC/ConventionalC"
  s.license      = 'MIT'
  s.author       = { "Peter DeWeese" => "peter@dewee.se" }
  s.source       = { :git => "https://github.com/ConventionalC/ConventionalC.git", :tag => s.version }
  s.requires_arc = true

  s.ios.source_files = 'ios/*.(h,m)', 'ConventionalC-Shared'
  s.ios.deployment_target = '5.1'
  s.ios.frameworks = 'Foundation'

  s.osx.source_files = 'ConventionalC-Mac', 'ConventionalC-Shared'
  s.osx.deployment_target = '10.7'
  s.osx.frameworks = 'Cocoa'
end
