
Pod::Spec.new do |spec|
 spec.name         = "ModernCoordinator"
  spec.version      = "0.0.2"
  spec.summary      = "A compact Coordinator pattern from XCoordinator"
  spec.homepage     = 'https://github.com/phamdinhduc795397/Coordinator'
  spec.license      = "MIT"
  spec.authors      = { 'Duc Pham' => 'phamdinhduc795397@gmail.com'}
  spec.swift_version = '5.1'
  spec.ios.deployment_target = '9.0'
  spec.source       = { :git => "https://github.com/phamdinhduc795397/Coordinator.git", :tag => spec.version }
  spec.module_name = 'ModernCoordinator'
  spec.source_files = 'Sources/Coordinator/*.swift'
  spec.exclude_files = "Classes/Exclude"
end


