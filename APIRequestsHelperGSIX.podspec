Pod::Spec.new do |s|
  s.name             = 'RequestsHelper'
  s.version          = '0.1.0'
  s.summary          = 'Framework for iOS networking.'

  s.description      = <<-DESC
  This framework is Objective C based, and it is make to help iOS networking.
                       DESC

  s.homepage         = 'https://github.com/dstojchev/RequestHelper'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dimitar@gsix.me' => 'dimitar@gsix.me' }
  s.source           = { :git => 'https://github.com/dstojchev/RequestHelper.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'APIRequestsHelperGSIX/Classes/**/*'
end
