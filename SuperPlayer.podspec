Pod::Spec.new do |spec|
    spec.name = 'SuperPlayer'
    spec.version = '9.5.1'
    spec.license = { :type => 'MIT' }
    spec.homepage = 'https://cloud.tencent.com/product/player'
    spec.authors = { 'annidyfeng' => 'annidyfeng@tencent.com' }
    spec.summary = '超级播放器'
    spec.source = { :git => 'https://github.com/yuchengxin123/SuperPlayer_iOS.git', :tag => 'v9.5.1' }

    spec.ios.deployment_target = '8.0'
    spec.tests_arc = true

    spec.dependency 'AFNetworking'
    spec.dependency 'SDWebImage'
    spec.dependency 'Masonry'
    #spec.dependency 'MMLayout'
    spec.dependency 'TXLiteAVSDK_Player'

    spec.static_framework = true
    spec.default_subspec = 'YCXPlayer'

    spec.ios.framework    = ['SystemConfiguration','CoreTelephony', 'VideoToolbox', 'CoreGraphics', 'AVFoundation', 'Accelerate']
    spec.ios.library = 'z', 'resolv', 'iconv', 'stdc++', 'c++', 'sqlite3'

     spec.subspec "YCXPlayer" do |s|
         s.source_files = 'Demo/TXLiteAVDemo/SuperPlayerKit/SuperPlayer/**/*.{h,m}'
         s.resource = 'Demo/TXLiteAVDemo/SuperPlayerKit/SuperPlayer/Resource/*'
     end
#    spec.resource = 'SuperPlayer/Resource/*'
    
    spec.subspec "Player" do |s|
        s.source_files = 'SuperPlayer/**/*.{h,m}'
        s.private_header_files = 'SuperPlayer/Utils/TXBitrateItemHelper.h', 'SuperPlayer/Views/SuperPlayerView+Private.h'
#        s.resource = 'SuperPlayer/Resource/*'
#如果要使用cocopods管理的TXLiteAVSDK_Player，就不注释这一行
#        s.dependency 'TXLiteAVSDK_Player'
#如果要使用最新的TXLiteAVSDK_Player，就不注释这一行
        framework_path="../../../SDK/TXLiteAVSDK_Player.framework"
        s.pod_target_xcconfig={
            'HEADER_SEARCH_PATHS'=>["$(PODS_TARGET_SRCROOT)/#{framework_path}/Headers"]
        }
    end
    spec.subspec "Professional" do |s|
        s.source_files = 'SuperPlayer/**/*.{h,m}'
        s.private_header_files = 'SuperPlayer/Utils/TXBitrateItemHelper.h', 'SuperPlayer/Views/SuperPlayerView+Private.h'
#        s.resource = 'SuperPlayer/Resource/*'
        framework_path="../../../SDK/TXLiteAVSDK_Professional.framework"
        s.pod_target_xcconfig={
            'HEADER_SEARCH_PATHS'=>["$(PODS_TARGET_SRCROOT)/#{framework_path}/Headers"]
        }
    end
    spec.subspec "Enterprise" do |s|
        s.source_files = 'SuperPlayer/**/*.{h,m}'
        s.private_header_files = 'SuperPlayer/Utils/TXBitrateItemHelper.h', 'SuperPlayer/Views/SuperPlayerView+Private.h'
#        s.resource = 'SuperPlayer/Resource/*'
        framework_path="../../../SDK/TXLiteAVSDK_Enterprise.framework"
        s.pod_target_xcconfig={
            'HEADER_SEARCH_PATHS'=>["$(PODS_TARGET_SRCROOT)/#{framework_path}/Headers"]
        }
    end
    spec.subspec "Smart" do |s|
        s.source_files = 'SuperPlayer/**/*.{h,m}'
        s.private_header_files = 'SuperPlayer/Utils/TXBitrateItemHelper.h', 'SuperPlayer/Views/SuperPlayerView+Private.h'
#        s.resource = 'SuperPlayer/Resource/*'
        framework_path="../../../SDK/TXLiteAVSDK_Smart.framework"
        s.pod_target_xcconfig={
            'HEADER_SEARCH_PATHS'=>["$(PODS_TARGET_SRCROOT)/#{framework_path}/Headers"]
        }
    end
    spec.subspec "UGC" do |s|
        s.source_files = 'SuperPlayer/**/*.{h,m}'
        s.private_header_files = 'SuperPlayer/Utils/TXBitrateItemHelper.h', 'SuperPlayer/Views/SuperPlayerView+Private.h'
#        s.resource = 'SuperPlayer/Resource/*'
        # framework_path="Frameworks/TXLiteAVSDK_UGC.framework"
        framework_path="../../../SDK/TXLiteAVSDK_UGC.framework"
        s.pod_target_xcconfig={
            'HEADER_SEARCH_PATHS'=>["$(PODS_TARGET_SRCROOT)/#{framework_path}/Headers"]
        }
    end
#     spec.subspec "UGC_PITU" do |s|
#         s.dependency 'SuperPlayer/Core'
#         s.dependency 'TXLiteAVSDK_UGC_PITU', '~> 5.2.5539'
# #        s.vendored_framework = "Frameworks/TXLiteAVSDK_UGC_PITU.framework"
#     end
#     spec.subspec "UGC_IJK" do |s|
#         s.dependency 'SuperPlayer/Core'
#         s.dependency 'TXLiteAVSDK_UGC_IJK', '~> 5.2.5539'
# #        s.vendored_framework = "Frameworks/TXLiteAVSDK_UGC_IJK.framework"
#     end
#     spec.subspec "UGC_IJK_PITU" do |s|
#         s.dependency 'SuperPlayer/Core'
#         s.dependency 'TXLiteAVSDK_UGC_IJK_PITU', '~> 5.2.5539'
# #        s.vendored_framework = "Frameworks/TXLiteAVSDK_UGC_IJK_PITU.framework"
#     end

    spec.frameworks = ["SystemConfiguration", "CoreTelephony", "VideoToolbox", "CoreGraphics", "AVFoundation", "Accelerate"]
    spec.libraries = [
      "z",
      "resolv",
      "iconv",
      "stdc++",
      "c++",
      "sqlite3"
    ]
end

# pod trunk push SuperPlayer.podspec --verbose --use-libraries --allow-warnings
