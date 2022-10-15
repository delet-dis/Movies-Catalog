# Uncomment the next line to define a global platform for your project
platform :ios, '16.0'

target 'MoviesCatalog' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Movies Catalog
  pod 'KeychainAccess'
  pod 'Alamofire'
  pod 'R.swift'
  pod 'SwiftLint'
  pod 'NeedleFoundation'
  pod 'SPAlert'
  pod 'SwiftyUserDefaults', '~> 5.0'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
   target.build_configurations.each do |config|
    config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
   end
  end
 end