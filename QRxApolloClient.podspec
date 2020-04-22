Pod::Spec.new do |spec|

  spec.name         = "QRxApolloClient"
  spec.version      = "0.0.5"
  spec.summary      = "RxSwift extensions for Apollo Client."
  spec.homepage     = "https://github.com/QusionDev/ios-q-rx-apollo-client/blob/master/README.md"
  spec.license      = {
    :type => 'MIT',
    :file => 'LICENSE'
  }
  spec.author       = { "Tomas Holicky" => "holickytomas@gmail.com" }
  spec.platform     = :ios
  spec.platform     = :ios, "11.0"
  spec.swift_versions = ['5.0']
  spec.source       = { :git => 'https://github.com/QusionDev/ios-q-rx-apollo-client.git', :tag => spec.version }
  spec.source_files  = "QRxApolloClient", "QRxApolloClient/**/*.swift"

  spec.dependency 'RxSwift', '>= 5.0'
  spec.dependency 'Apollo', '~> 0.20.0'
end
