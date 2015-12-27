platform :ios, '9.2'

source 'https://github.com/CocoaPods/Specs.git'

use_frameworks!

target :PonyFaces do
	pod 'PINRemoteImage'
	pod 'SKTagView'
	pod 'MagicalRecord'
	pod 'SYFavoriteButton'
	pod 'FXReachability'
	pod 'DZNEmptyDataSet'
end

post_install do | installer |
	require 'fileutils'
	FileUtils.copy('Pods/Target Support Files/Pods-PonyFaces/Pods-PonyFaces-acknowledgements.plist', 'PonyFaces/Settings.bundle/Acknowledgements.plist')
end