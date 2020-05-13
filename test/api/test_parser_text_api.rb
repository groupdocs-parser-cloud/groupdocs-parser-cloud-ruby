#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) 2003-2019 Aspose Pty Ltd
# </copyright>
# <summary>
#   Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to deal
#  in the Software without restriction, including without limitation the rights
#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#  copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:
#
#  The above copyright notice and this permission notice shall be included in all
#  copies or substantial portions of the Software.
#
#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#  SOFTWARE.
# </summary>
# --------------------------------------------------------------------------------------------------------------------
#

module GroupDocsParserCloud
  require_relative "./../test_context"
  require_relative "./../test_settings"
  require_relative "./../test_file"

  class TestParserTextApi < TestContext
    include MiniTest::Assertions

    def test_extract_txt
      file = TestFile.one_page
      options = TextOptions.new
      options.file_info = file.file_info
      request = TextRequest.new(options)

      response = @parse_api.text(request)
      assert response != nil
      assert_equal "First Page\r\r\f", response.text
    end

    def test_extract_pages
      file = TestFile.four_pages
      options = TextOptions.new
      options.file_info = file.file_info
      options.start_page_number = 0
      options.count_pages_to_extract = 4
      text_options = FormattedTextOptions.new
      text_options.mode = "PlainText"
      options.formatted_text_options = text_options
      request = TextRequest.new(options)

      response = @parse_api.text(request)
      assert response != nil
      assert_equal 0, response.pages[0].page_index
      assert_equal "Text inside bookmark 0\r\n\r\nPage 0 heading\r\n\r\nPage Text - Page 0\r\n\r\n\fText inside bookmark 1\r\n\r\n", response.pages[0].text
      assert_equal 3, response.pages[3].page_index
      assert_equal "\fText inside bookmark 3\r\n\r\nPage 3 heading\r\n\r\nPage Text - Page 3\r\n\r\n", response.pages[3].text
    end

    def test_extract_formatted
      file = TestFile.formatted_document
      options = TextOptions.new
      options.file_info = file.file_info
      text_options = FormattedTextOptions.new
      text_options.mode = "Html"
      options.formatted_text_options = text_options
      request = TextRequest.new(options)

      response = @parse_api.text(request)
      assert response != nil
      assert response.text.include? "<b>Bold text</b>"
      assert response.text.include? "<i>Italic text</i>"
      assert response.text.include? "<h1>Heading 1</h1>"
      assert response.text.include? "<tr><td><p>table</p></td>"
      assert response.text.include? "<a href=\"http://targetwebsite.domain\">Hyperlink </a>"
      assert response.text.include? "<ol><li><i>First element</i>"
    end

    def test_extract_text_file_not_found_result
      file = TestFile.not_exist
      options = TextOptions.new
      options.file_info = file.file_info
      request = TextRequest.new(options)

      error = assert_raises ApiError do
        @parse_api.text(request)
      end

      assert error.message.include? "Can't find file located at 'folder\\file-not-exist.pdf'."
    end

    def test_extract_text_incorrect_password
      file = TestFile.password_protected
      file.password = "123"
      options = TextOptions.new
      options.file_info = file.file_info
      request = TextRequest.new(options)

      error = assert_raises ApiError do
        @parse_api.text(request)
      end

      assert error.message.include? "Password provided for file 'words\\docx\\password-protected.docx' is incorrect."
    end
  end
end
