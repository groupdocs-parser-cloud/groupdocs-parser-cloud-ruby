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

  class TestParserContainerApi < TestContext
    include MiniTest::Assertions

    def test_get_container_item_info
      file = TestFile.zip
      options = ContainerOptions.new
      options.file_info = file.file_info
      request = ContainerRequest.new(options)

      response = @info_api.container(request)
      assert response != nil
      assert_equal 2, response.container_items.count
      assert response.container_items.any? { |a| a.name == "one-page.docx" }
    end

    def test_get_container_item_info_file_not_found_result
      file = TestFile.not_exist
      options = ContainerOptions.new
      options.file_info = file.file_info
      request = ContainerRequest.new(options)

      error = assert_raises ApiError do
        @info_api.container(request)
      end
      assert error.message.include? "Can't find file located at 'folder\\file-not-exist.pdf'."
    end

    def test_get_container_item_info_unsupported_file
      file = TestFile.four_pages
      options = ContainerOptions.new
      options.file_info = file.file_info
      request = ContainerRequest.new(options)

      error = assert_raises ApiError do
        @info_api.container(request)
      end
      assert error.message.include? "The specified file 'words\\docx\\four-pages.docx' has type which is not currently supported."
    end

    def test_get_container_item_info_empty_options
      request = ContainerRequest.new(nil)

      error = assert_raises ArgumentError do
        @info_api.container(request)
      end
      assert error.message.include? "Missing the required parameter options when calling InfoApi.container"
    end
  end
end
