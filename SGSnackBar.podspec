#
# Be sure to run `pod lib lint SGSnackBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "SGSnackBar"
  s.version          = "1.0.1"
  s.summary          = "An Android snackbar type information toast/popup"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
  s.description      = <<-DESC
A highly customizable view similar to android snackbar which can be shown to show user simple toast updates that auto dismiss, or show with a action button to get user feedback for simple cases like : undo a message delete, show push notification content and get user action and so on.
                       DESC

s.homepage         = "https://github.com/Shubhank101/SGSnackBar"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Shubhank Gupta" => "shubhankscores@gmail.com" }
  s.source           = { :git => "https://github.com/Shubhank101/SGSnackBar.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
#s.resource_bundles = {
#    'SGSnackBar' => ['Pod/Assets/*.png']
#  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
