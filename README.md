# GroupDocs.Parser Cloud Ruby SDK
Ruby gem for communicating with the GroupDocs.Parser Cloud API. This SDK allows you to work with GroupDocs.Parser Cloud REST APIs in your Ruby applications.

## Requirements

Ruby 2.4+

## Installation

Install `groupdocs_parser_cloud` from [RubyGems](https://rubygems.org):

```sh
gem install groupdocs_parser_cloud
```

Or add the dependency to your Gemfile and run `bundle install`:

```ruby
gem "groupdocs_parser_cloud", "~> 26.2"
```

## Getting Started

Please follow the [installation procedure](#installation) and then run the following code:

```ruby
# Import modules
require "./Common.rb"

#  This example demonstrates how to extract formatted text from document.
class ExtractFormattedText
  def self.Run()
    parseApi = GroupDocsParserCloud::ParseApi.from_config($config)
    options = GroupDocsParserCloud::TextOptions.new
    options.file_info = GroupDocsParserCloud::FileInfo.new
    options.file_info.file_path = "words-processing/docx/formatted-document.docx"

    text_options = GroupDocsParserCloud::FormattedTextOptions.new
    text_options.mode = "Markdown"
    options.formatted_text_options = text_options

    request = GroupDocsParserCloud::TextRequest.new(options)
    response = parseApi.text(request)
    puts("Text:" + response.text)
  end
end
```

## Licensing
GroupDocs.Parser Cloud Ruby SDK licensed under [MIT License](LICENSE).

## Resources
+ [**Website**](https://www.groupdocs.cloud)
+ [**Product Home**](https://products.groupdocs.cloud/parser)
+ [**Documentation**](https://docs.groupdocs.cloud/display/parsercloud/Home)
+ [**Free Support Forum**](https://forum.groupdocs.cloud/c/parser)
+ [**Blog**](https://blog.groupdocs.cloud/category/parser)

## Contact Us
Your feedback is very important to us. Please feel free to contact us