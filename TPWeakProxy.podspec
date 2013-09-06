Pod::Spec.new do |s|
  s.name         = "TPWeakProxy"
  s.version      = "1.0.0"
  s.summary      = "An NSProxy for converting strong references to weak ones."
  s.description  = <<-DESC
TPWeakProxy holds a weak reference to the object it proxies for.

The primary use case is to break reference cycles.
                   DESC
  s.homepage     = "https://github.com/tetherpad/TPWeakProxy"
  s.license      = 'MIT'
  s.author       = { "Mark Ferlatte" => "ferlatte@cryptio.net" }
  s.source       = { 
    :git => "https://github.com/tetherpad/TPWeakProxy.git", 
    :tag => "1.0.0"
  }
  s.source_files = 'TPWeakProxy.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.7'
end