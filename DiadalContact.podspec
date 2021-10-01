
  Pod::Spec.new do |s|
    s.name = 'DiadalContact'
    s.version = '0.0.5'
    s.summary = 'Contacts Plugin for Capacitor'
    s.license = 'MIT'
    s.homepage = 'https://github.com/diadal/contacts'
    s.author = 'Jonathan Gerber'
    s.source = { :git => 'https://github.com/diadal/contacts', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '12.0'
    s.dependency 'Capacitor'
  end
