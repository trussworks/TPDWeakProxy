Pod::Spec.new do |s|
  s.name         = "TPDWeakProxy"
  s.version      = "1.1.1"
  s.summary      = "An NSProxy for converting strong references into weak ones."
  s.description  = <<-DESC
TPDWeakProxy holds a weak reference to the object it proxies for.

The primary use case is to break reference cycles.
DESC
  s.homepage     = "https://github.com/trussworks/TPDWeakProxy"
  s.license      = 'MIT'
  s.authors      = {
    "Mark Ferlatte" => "mark@truss.works",
    "Jen Leech" => "jen@truss.works"
  }
  s.source       = {
    :git => "https://github.com/trussworks/TPDWeakProxy.git",
    :tag => s.version.to_s
  }
  s.source_files = 'TPDWeakProxy/TPDWeakProxy.{h,m}'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'
end
