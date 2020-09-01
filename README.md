# GroupDocs.Parser Cloud Ruby SDK
Ruby gem for communicating with the GroupDocs.Parser Cloud API

## Installation

A gem of groupdocs_parser_cloud is available at [rubygems.org](https://rubygems.org). You can install it with:

```shell
gem install groupdocs_parser_cloud
```    

To add dependency to your app copy following into your Gemfile and run `bundle install`:

```
gem "groupdocs_parser_cloud", "~> 20.6"
```

## Getting Started

Please follow the [installation](#installation) procedure and then run the following code:
```ruby
# Load the gem
require 'groupdocs_parser_cloud'

# Get your app_sid and app_key at https://dashboard.groupdocs.cloud (free registration is required).
app_sid = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX"
app_key = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"

# Create instance of the API class
api = GroupDocsParserCloud::InfoApi.from_keys(app_sid, app_key)

# Retrieve supported file-formats
response = api.get_supported_file_formats

# Print out supported file-formats
puts("Supported file-formats:")
response.formats.each do |format|
  puts("#{format.file_format} (#{format.extension})") 
end
```

## Licensing
GroupDocs.Parser Cloud Ruby SDK licensed under [MIT License](LICENSE).

[Home](https://www.groupdocs.cloud/) | [Product Page](https://products.groupdocs.cloud/parser/ruby) | [Docs](https://docs.groupdocs.cloud/parser/) | [Demos](https://products.groupdocs.app/parser/family) | [API Reference](https://apireference.groupdocs.cloud/parser/) | [Examples](https://github.com/groupdocs-parser-cloud/groupdocs-parser-cloud-ruby-samples) | [Blog](https://blog.groupdocs.cloud/category/parser/) | [Free Support](https://forum.groupdocs.cloud/c/parser) | [Free Trial](https://purchase.groupdocs.cloud/trial)
