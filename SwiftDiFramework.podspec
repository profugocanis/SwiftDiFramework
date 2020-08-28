Pod::Spec.new do |s|  
    s.name              = 'SwiftDiFramework'
    s.version           = '1.0.3'
    s.summary           = 'A really cool SDK that logs stuff.'
    s.homepage          = 'https://github.com/profugocanis/SwiftDiFramework'

    s.author            = { 'ijk' => 'profugo.canis@gmail.com' }
    s.license           = { :type => 'Apache-2.0', :file => 'LICENSE' }

    s.platform          = :ios
    s.source       = { :git => "https://github.com/profugocanis/SwiftDiFramework.git", :tag => "#{s.version}" }

end


# https://github.com/profugocanis/SwiftDi/raw/master/SwiftDi.zip
# https://github.com/profugocanis/SwiftDiFramework/raw/master/SwiftDi.zip
