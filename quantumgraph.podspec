require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'version.json')))

Pod::Spec.new do |s|
  s.name         = "quantumgraph"
  s.version      = package['version']
  s.summary      = "iOS Sdk helps you to track user events in your app and display notifications"

  s.homepage     = "https://www.appier.com/en/index.html"
  s.documentation_url = "https://docs.aiqua.appier.com/docs"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "appier" => "shiv.raj@appier.com" }
  s.platform     = :ios, '8.0'
  s.source       = { :git => "https://github.com/appier/aiqua-ios-sdk.git", :tag => "v#{s.version}"}
  s.default_subspec = "ios-sdk"

  s.subspec 'ios-sdk' do |ss|
    ss.library = 'z'
    ss.source_files = "Classes/**/*.{h, m, swift}"
    ss.vendored_library = "Classes/**/*.a"
    ss.frameworks = 'AdSupport', 'CoreTelephony', 'SystemConfiguration', 'CoreLocation', 'ImageIO', 'MobileCoreServices'
  end

  s.requires_arc = true
  s.static_framework = true
end
