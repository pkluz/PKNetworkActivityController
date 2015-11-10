Pod::Spec.new do |s|
  s.name                      = 'PKHUD'
  s.module_name               = 'PKHUD'
  s.version                   = '0.0.1'
s.summary                     = 'A simple and lightweight network activity indicator controller written in Swift, exclusively for iOS 8 and above.'
  s.homepage                  = 'https://github.com/pkluz/PKNetworkActivityController'
  s.license                   = 'MIT'
  s.author                    = { 'Philip Kluz' => 'Philip.Kluz@gmail.com' }
  s.platform                  = :ios, '8.0'
  s.ios.deployment_target     = '8.0'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/pkluz/PKNetworkActivityController.git', :tag => s.version.to_s }
  s.source_files              = 'PKHUD/**/*.{h,swift}'
  s.resources                 = 'PKHUD/*.xcassets'
end
