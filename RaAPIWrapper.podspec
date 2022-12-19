# pod lib lint --verbose --allow-warnings RaAPIWrapper.podspec
# pod trunk push --verbose --allow-warnings RaAPIWrapper.podspec

Pod::Spec.new do |s|
  
  s.name = 'RaAPIWrapper'
  
  s.version = '0.9.0'
  
  s.summary = 'Makes it easier to define a network request.'
  
  s.description = 'Use `@propertyWrapper to provide the necessary data for network requests in a more aggregated form.'
  
  s.homepage = 'https://github.com/rakuyoMo/RaAPIWrapper'
  
  s.license = 'MIT'
  
  s.author = { 'Rakuyo' => 'rakuyo.mo@gmail.com' }
  
  s.source = { :git => 'https://github.com/rakuyoMo/RaAPIWrapper.git', :tag => s.version.to_s }
  
  s.requires_arc = true
  
  s.ios.deployment_target = '11.0'
  s.osx.deployment_target = '10.13'
  s.tvos.deployment_target = '11.0'
  s.watchos.deployment_target = '4.0'
  
  s.swift_versions = ['5']
  
  s.module_name = 'APIWrapper'
  
  s.source_files = 'Sources/*/**/*'

  s.dependency 'Alamofire'
  
end
