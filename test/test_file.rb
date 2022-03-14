#
# --------------------------------------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="test_file.rb">
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
  class TestFile
    attr_accessor :file_name
    attr_accessor :folder
    attr_accessor :password

    def path
      folder + file_name
    end

    def file_info
      info = FileInfo.new
      info.file_path = path
      info.password = password
      info
    end

    def self.password_protected
      f = TestFile.new
      f.file_name = "password-protected.docx"
      f.folder = "words\\docx\\"
      f.password = "password"
      f
    end

    def self.four_pages
      f = TestFile.new
      f.file_name = "four-pages.docx"
      f.folder = "words\\docx\\"
      f
    end

    def self.one_page
      f = TestFile.new
      f.file_name = "one-page.docx"
      f.folder = "words\\docx\\"
      f
    end

    def self.template_document_docx
      f = TestFile.new
      f.file_name = "template-document.docx"
      f.folder = "words\\docx\\"
      f
    end

    def self.formatted_document
      f = TestFile.new
      f.file_name = "formatted-document.docx"
      f.folder = "words\\docx\\"
      f
    end

    def self.encoding_detection
      f = TestFile.new
      f.file_name = "encoding-detection.txt"
      f.folder = "words\\txt\\"
      f
    end

    def self.zip
      f = TestFile.new
      f.file_name = "docx.zip"
      f.folder = "containers\\archive\\"
      f
    end

    def self.zip_with_email_image_pdf
      f = TestFile.new
      f.file_name = "zip-eml-jpg-pdf.zip"
      f.folder = "containers\\archive\\"
      f
    end

    def self.jpeg_file
      f = TestFile.new
      f.file_name = "document.jpeg"
      f.folder = "image\\jpeg\\"
      f
    end

    def self.image_and_attachment
      f = TestFile.new
      f.file_name = "embedded-image-and-attachment.eml"
      f.folder = "email\\eml\\"
      f
    end

    def self.pdf
      f = TestFile.new
      f.file_name = "template-document.pdf"
      f.folder = "pdf\\"
      f
    end

    def self.pdf_container
      f = TestFile.new
      f.file_name = "PDF with attachements.pdf"
      f.folder = "pdf\\"
      f.password = "password"
      f
    end

    def self.not_exist
      f = TestFile.new
      f.file_name = "file-not-exist.pdf"
      f.folder = "folder\\"
      f
    end

    def self.rar
      f = TestFile.new
      f.file_name = "sample.rar"
      f.folder = "containers\\archive\\"
      f
    end

    def self.tar
      f = TestFile.new
      f.file_name = "sample.tar"
      f.folder = "containers\\archive\\"
      f
    end

    def self.md
      f = TestFile.new
      f.file_name = "sample.md"
      f.folder = "words\\docx\\"
      f
    end

    def self.test_files_list
      [
        self.password_protected,
        self.four_pages,
        self.one_page,
        self.template_document_docx,
        self.formatted_document,
        self.encoding_detection,
        self.zip,
        self.zip_with_email_image_pdf,
        self.jpeg_file,
        self.image_and_attachment,
      ]
    end
  end
end
