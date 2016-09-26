Pod::Spec.new do |s|
  s.name                      = 'PKNetworkActivityController'
  s.module_name               = 'PKNetworkActivityController'
  s.version                   = '0.0.2'
s.summary                     = 'A simple and lightweight network activity indicator controller written in Swift, exclusively for iOS 8 and above.'
  s.homepage                  = 'https://github.com/dimohamdy/PKNetworkActivityController'
  s.license                   = 'MIT'
  s.author                    = { 'Philip Kluz' => 'philip.kluz@gmail.com' }
  s.platform                  = :ios, '8.0'
  s.ios.deployment_target     = '8.0'
  s.requires_arc              = true
  s.source                    = { :git => 'https://github.com/dimohamdy/PKNetworkActivityController.git', :tag => s.version.to_s }
  s.source_files              = 'PKNetworkActivity/**/*.{h,swift}'
end
