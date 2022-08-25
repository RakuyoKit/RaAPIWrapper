# pod lib lint --verbose --allow-warnings APIWrapper.podspec
# pod trunk push --verbose --allow-warnings APIWrapper.podspec

Pod::Spec.new do |s|
  
  s.name             = 'APIWrapper'
  
  s.version          = '0.1.0'
  
  s.summary          = 'Wrappers for requesting api.'
  
  s.description      = 'Provide the necessary data for the requesting api in a more aggregated form.'
  
  s.homepage         = 'https://github.com/rakuyoMo/APIWrapper'
  
  s.license          = 'MIT'
  
  s.author           = { 'Rakuyo' => 'rakuyo.mo@gmail.com' }
  
  s.source           = { :git => 'https://github.com/rakuyoMo/APIWrapper.git', :tag => s.version.to_s }
  
  s.requires_arc     = true

  s.platform         = :ios, '10.0'
  
  s.swift_version    = '5.0'
  
  s.module_name      = 'APIWrapper'
  
  s.source_files     = 'Sources/APIWrapper/*'
  
end
