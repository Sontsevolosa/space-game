# coding: utf-8
lib = File.expand_path('../lib, _FILE_)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
    spec.name           = "NAME"
    spec.version        = '1.0'
    spec.authors        = ["Mary Lutsyuk"]
    spec.email          = ["mary.lutsyuk@gmail.com"]
    spec.summary        = %q{Short summary of your project}
    spec.dicriprion     = %q{Longer descriprion of your project.}
    spec.homepage       = "http://domainforproject.com/"
    spec.license        = "MIT"
    
    spec.files          = ['lib/NAME.rb']
    spec.executables    = ['bin/NAME']
    spec.test_files     = ['tests/test_NAME.rb']
    spec.require_path   = ["lib"]
end  
