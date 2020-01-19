
Pod::Spec.new do |s|
  s.name         = "Tools"
  s.version      = "0.1.0"
  s.summary      = "Powerful & Efficient URL Routing for Swift"
  s.homepage     = "https://github.com/WessonWu/Tools"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "wuweixin" => "wessonwu94@gmail.com" }
  s.source       = { :git => "https://github.com/WessonWu/Tools.git", :tag => "#{s.version}" }
  s.requires_arc     = true
  s.swift_version    = "5.0"
  
  s.ios.deployment_target = "8.0"
  s.source_files = "Source/**/*.swift"
  s.subspec "Color" do |sp|
    sp.frameworks = "UIKit"
    sp.source_files = "Source/Color/**/*.swift"
  end
  
  s.subspec "Device" do |sp|
    sp.frameworks = "UIKit"
    sp.source_files = "Source/Device/**/*.swift"
  end
  
  s.subspec "Rect" do |sp|
    sp.frameworks = "CoreGraphics"
    sp.source_files = "Source/Rect/**/*.swift"
  end
  
  s.subspec "Image" do |sp|
    sp.frameworks = "UIKit"
    sp.source_files = "Source/Image/**/*.swift"
  end
  
  s.subspec "ViewController" do |sp|
    sp.frameworks = "UIKit"
    sp.source_files = "Source/ViewController/**/*.swift"
  end
  
   s.default_subspecs = ["Color", "Device", "Rect", "ViewController"]
  
  # # for test
  # s.test_spec "Tests" do |test_spec|
  #   test_spec.source_files = "Tests/**/*"
  #   test_spec.dependency "URLRouter/Matcher"
  #   test_spec.dependency "URLRouter/Router"
  # end
  
end
