Pod::Spec.new do |s|

  s.name         = "LayoutKit"
  s.version      = "0.5"
  s.summary      = "A lightweight library for simple view layout in Swift."
  s.homepage     = "https://github.com/justinroam/LayoutKit"
  s.license      = "MIT License"
  s.source       = { :git => "https://github.com/justinroam/LayoutKit.git" }
  s.authors      = { 'Avario' => 'avario' }
  s.source_files = 'LayoutKit/LayoutKit/*.swift'
  s.module_name  = 'LayoutKit'
  s.ios.deployment_target = '9.0'

end
