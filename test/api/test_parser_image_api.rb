#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd">
#    Copyright (c) Aspose Pty Ltd
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

  class TestParserImageApi < TestContext
    include MiniTest::Assertions

    def test_get_image_file_not_found_result
      file = TestFile.not_exist
      options = ImagesOptions.new
      options.file_info = file.file_info
      request = ImagesRequest.new(options)

      error = assert_raises ApiClientError do
        @parse_api.images(request)
      end

      assert error.message.include? "Can't find file located at 'folder\\file-not-exist.pdf'."
    end

    def test_get_image_incorrect_password
      file = TestFile.password_protected
      file.password = "123"
      options = ImagesOptions.new
      options.file_info = file.file_info
      request = ImagesRequest.new(options)

      error = assert_raises ApiClientError do
        @parse_api.images(request)
      end

      assert error.message.include? "Password provided for file 'words\\docx\\password-protected.docx' is incorrect."
    end

    def test_get_image_docx
      file = TestFile.password_protected
      options = ImagesOptions.new
      options.file_info = file.file_info
      request = ImagesRequest.new(options)

      response = @parse_api.images(request)
      assert response != nil
      response.images.each do |image|
        assert image.path.include? "parser/images/words/docx/four-pages_docx/image"
        assert image.download_url != nil
      end
    end

    def test_get_image_container
      file = TestFile.zip_with_email_image_pdf
      options = ImagesOptions.new
      options.file_info = file.file_info
      request = ImagesRequest.new(options)

      response = @parse_api.images(request)
      assert response != nil
      response.images.each do |image|        
        assert image.path.include? "containers/archive/zip-eml-jpg-pdf_zip/"
        assert image.download_url != nil
      end
    end

    def test_get_image_email
      file = TestFile.image_and_attachment
      options = ImagesOptions.new
      options.file_info = file.file_info
      request = ImagesRequest.new(options)

      response = @parse_api.images(request)
      assert response != nil
      response.images.each do |image|
        assert image.path.include? "parser/images/email/eml/embedded-image-and-attachment_eml/"
        assert image.download_url != nil
      end
    end

    def test_get_image_pdf_pages
      file = TestFile.pdf
      options = ImagesOptions.new
      options.file_info = file.file_info
      options.start_page_number = 1
      options.count_pages_to_extract = 2
      request = ImagesRequest.new(options)

      response = @parse_api.images(request)
      assert response != nil
      assert response.pages != nil
      assert 2, response.pages.count
      assert response.pages[0].images[0].path.include? "parser/images/pdf/template-document_pdf/page_1/image_0.jpeg"
      assert response.pages[1].images[0].path.include? "parser/images/pdf/template-document_pdf/page_2/image_0.jpeg"
    end

    def test_get_image_pdf_container_item_pages
      file = TestFile.pdf_container
      options = ImagesOptions.new
      options.file_info = file.file_info
      container_item_info = ContainerItemInfo.new
      container_item_info.relative_path = "template-document.pdf"
      options.container_item_info = container_item_info
      options.start_page_number = 1
      options.count_pages_to_extract = 2
      request = ImagesRequest.new(options)

      response = @parse_api.images(request)
      assert response != nil
      assert response.pages != nil
      assert 2, response.pages.count
      assert response.pages[0].images[0].path.include? "parser/images/template-document_pdf/page_1/image_0.jpeg"
      assert response.pages[1].images[0].path.include? "parser/images/template-document_pdf/page_2/image_0.jpeg"
    end

    def test_get_image_out_of_range_pages
      file = TestFile.pdf
      options = ImagesOptions.new
      options.file_info = file.file_info
      options.start_page_number = 3
      options.count_pages_to_extract = 5
      request = ImagesRequest.new(options)

      error = assert_raises ApiClientError do
        @parse_api.images(request)
      end

      assert error.message.include? "Request parameters missing or have incorrect format"
    end

    def test_get_image_zip_pages_error
      file = TestFile.zip
      options = ImagesOptions.new
      options.file_info = file.file_info
      options.start_page_number = 3
      options.count_pages_to_extract = 5
      request = ImagesRequest.new(options)

      error = assert_raises ApiClientError do
        @parse_api.images(request)
      end

      assert error.message.include? "The specified file 'containers\\archive\\docx.zip' has type which is not currently supported."
    end
  end
end
