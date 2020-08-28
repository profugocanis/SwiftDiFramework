Pod::Spec.new do |s|  
    s.name              = 'SwiftDiFramework'
    s.version           = '1.0.3'
    s.summary           = 'A really cool SDK that logs stuff.'
    s.homepage          = 'https://github.com/profugocanis/SwiftDiFramework'

    s.author            = { 'ijk' => 'profugo.canis@gmail.com' }
    s.license           = { :type => 'MIT', :file => 'LICENSE' }

    s.platform          = :ios
    s.source            = { :git => "https://github.com/profugocanis/SwiftDiFramework.git", :tag => "#{s.version}" }
    s.source_files  = "SwiftDiFramework/**/*.{h,m,swift}"

    s.ios.deployment_target = "12.0"
    s.swift_version = "5.0"

    s.dependency 'RxSwift'

end


# https://github.com/profugocanis/SwiftDi/raw/master/SwiftDi.zip
# https://github.com/profugocanis/SwiftDiFramework/raw/master/SwiftDi.zip
