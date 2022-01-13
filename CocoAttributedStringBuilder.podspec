#
#  Be sure to run `pod spec lint CocoAttributedStringBuilder.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|


  spec.name         = "CocoAttributedStringBuilder"
  spec.version      = "1.0.0"
  spec.summary      = "Pure swift library to build NSAttributedString"


  spec.description  = <<-DESC
       This pod will help you create NSAttributedString in an easy way
                   DESC

  spec.homepage     = "https://github.com/kiarashvosough1999/CocoAttributedStringBuilder.git"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  spec.license      = { :type => "MIT", :file => "LICENSE" }


  spec.author             = { "kiarashvosough1999" => "vosough.k@gmail.com" }
  # Or just: spec.author    = "kiarashvosough1999"
  # spec.authors            = { "kiarashvosough1999" => "vosough.k@gmail.com" }
  # spec.social_media_url   = "https://twitter.com/kiarashvosough1999"


  # spec.platform     = :ios
  # spec.platform     = :ios, "9.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "9.0"
  spec.osx.deployment_target = "10.10"
  spec.watchos.deployment_target = "2.0"
  spec.tvos.deployment_target = "9.0"

  spec.source = { :git => "https://github.com/kiarashvosough1999/CocoAttributedStringBuilder.git", :tag => "#{spec.version}" }

  spec.source_files  =  "Sources/**/*.{h,m,swift}"
  spec.exclude_files = "Classes/Exclude"
  
  spec.swift_versions = ['5.3', '5.4' , '5.5']
  
  spec.framework      = ['Foundation', 'CoreGraphics']
  spec.ios.framework  = 'UIKit'
  spec.osx.framework  = 'AppKit'

  # spec.public_header_files = "Classes/**/*.h"


  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
