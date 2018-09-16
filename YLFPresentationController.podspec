#
# Be sure to run `pod lib lint YLFPresentationController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YLFPresentationController'
  s.version          = '0.1.1'
  s.summary          = 'A lightweight controller implemented for present half or overlay view controller.'

  s.description      = <<-DESC
    support present view controller with header and footer, and with your own animation transition
                       DESC

  s.homepage         = 'https://github.com/leavesster/YLFPresentationController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.author 	         = 'leavesster'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.source           = { :git => 'https://github.com/leavesster/YLFPresentationController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'YLFPresentationController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'YLFPresentationController' => ['YLFPresentationController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
