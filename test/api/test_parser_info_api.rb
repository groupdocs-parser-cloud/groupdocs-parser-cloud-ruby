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

  class TestParserInfoApi < TestContext
    include MiniTest::Assertions

    def test_get_info_txt
      file = TestFile.encoding_detection
      options = InfoOptions.new
      options.file_info = file.file_info
      request = GetInfoRequest.new(options)

      response = @info_api.get_info(request)
      assert response != nil
      assert_equal "PLAIN TEXT FILE", response.file_type.file_format.upcase
      assert_equal 1, response.page_count
    end

    def test_get_info_docx
      file = TestFile.four_pages
      options = InfoOptions.new
      options.file_info = file.file_info
      request = GetInfoRequest.new(options)

      response = @info_api.get_info(request)
      assert response != nil
      assert_equal "MICROSOFT WORD OPEN XML DOCUMENT", response.file_type.file_format.upcase
      assert_equal 4, response.page_count
    end

    def test_get_info_container_item
      file = TestFile.zip
      options = InfoOptions.new
      options.file_info = file.file_info
      options.container_item_info = ContainerItemInfo.new({ "RelativePath" => "one-page.docx" })
      request = GetInfoRequest.new(options)

      response = @info_api.get_info(request)
      assert response != nil
      assert_equal "MICROSOFT WORD OPEN XML DOCUMENT", response.file_type.file_format.upcase
      assert_equal 1, response.page_count
    end

    def test_get_info_file_not_found_result
      file = TestFile.not_exist
      options = InfoOptions.new
      options.file_info = file.file_info
      request = GetInfoRequest.new(options)
      begin
        @info_api.get_info(request)
      rescue ApiError => error
        assert error.message == "Can't find file located at 'folder\\file-not-exist.pdf'."
      end
    end

    def test_get_info_incorrect_password
      file = TestFile.password_protected
      file.password = "123"
      options = InfoOptions.new
      options.file_info = file.file_info
      request = GetInfoRequest.new(options)

      error = assert_raises ApiError do
        @info_api.get_info(request)
      end
      assert error.message.include? "Password provided for file 'words\\docx\\password-protected.docx' is incorrect."
    end
  end
end
