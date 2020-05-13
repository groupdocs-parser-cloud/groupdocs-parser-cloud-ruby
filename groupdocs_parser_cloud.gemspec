require './lib/groupdocs_parser_cloud/version'

Gem::Specification.new do |s|
  s.name        = 'groupdocs_parser_cloud'
  s.version     = GroupDocsParserCloud::VERSION
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.summary     = 'GroupDocs.Parser Cloud Ruby SDK'
  s.description = 'Ruby gem for communicating with the GroupDocs.Parser Cloud API'
  s.author      = 'GroupDocs'
  s.email       = 'support@groupdocs.cloud'
  s.homepage    = 'https://products.groupdocs.cloud/parser/ruby'
  s.metadata    = { 'source_code_uri' => 'https://github.com/groupdocs-parser-cloud/groupdocs-parser-cloud-ruby' }

  s.add_runtime_dependency 'faraday', '~> 0.14.0'
  s.add_runtime_dependency 'mimemagic', '~> 0.3.2'
  s.add_runtime_dependency 'addressable', '~> 2.5.0', '>= 2.5.0'
  
  s.add_development_dependency 'minitest', '~> 5.11', '>= 5.11.3'

  s.files         = Dir['lib/**/*.rb']
  s.require_paths = ['lib']
  s.required_ruby_version = '~> 2.3'
end
