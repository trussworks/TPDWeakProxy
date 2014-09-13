Pod::Spec.new do |s|
  s.name         = "TPDWeakProxy"
  s.version      = "1.0.0"
  s.summary      = "An NSProxy for converting strong references into weak ones."
  s.description  = <<-DESC
TPDWeakProxy holds a weak reference to the object it proxies for.

The primary use case is to break reference cycles.
                   DESC
  s.homepage     = "https://github.com/tetherpad/TPDWeakProxy"
  s.license      = 'MIT'
  s.authors      = {
    "Mark Ferlatte" => "mark@tetherpad.com",
    "Jen Leech" => "jen@tetherpad.com"
  }
  s.source       = { 
    :git => "https://github.com/tetherpad/TPDWeakProxy.git", 
    :tag => s.version.to_s
  }
  s.source_files = 'TPDWeakProxy/TPDWeakProxy.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
end
