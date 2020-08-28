Pod::Spec.new do |s|  
    s.name              = 'SwiftDiFramework'
    s.version           = '1.0.3'
    s.summary           = 'A really cool SDK that logs stuff.'
    s.homepage          = 'https://github.com/profugocanis/SwiftDiFramework'

    s.author            = { 'ijk' => 'profugo.canis@gmail.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :sos
    s.source            = { :http => 'https://github.com/profugocanis/SwiftDiFramework/raw/master/SwiftDiFramework.zip' }

    s.ios.deployment_target = '12.0'
    s.ios.vendored_frameworks = 'SwiftDiFramework.framework'
end


# https://github.com/profugocanis/SwiftDi/raw/master/SwiftDi.zip
# https://github.com/profugocanis/SwiftDiFramework/raw/master/SwiftDi.zip
