Pod::Spec.new do |spec|

  spec.name = 'DependencyInjectorTestUtils'
  spec.version = '0.1.0'
  spec.summary = 'Micro feature description.'
  spec.homepage = 'https://github.com/jjfernandes87/DependencyInjector.git'
  spec.author = { 'Framework Author' => "author@email.com" }
  spec.license = { :type => 'Private' }
  spec.source = { :git => 'https://github.com/jjfernandes87/DependencyInjector.git',
                  :tag => spec.version.to_s }

  spec.ios.deployment_target = '11.0'
  spec.requires_arc = true

  spec.cocoapods_version = '>= 1.5'
  spec.swift_version = '5.0'

  spec.source_files = 'DependencyInjectorTests/Utils/**/*.{swift}'
  spec.dependency 'DependencyInjector'

end