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

  class TestParserParseApi < TestContext
    include MiniTest::Assertions

    def test_parse_document
      parse_options = ParseOptions.new
      file = TestFile.template_document_docx
      parse_options.file_info = file.file_info
      parse_options.template = TestParserParseApi.get_template
      request = ParseRequest.new(parse_options)
      data = @parse_api.parse(request)
      assert data != nil
      assert_equal 1, data.count

      # fieldNames = ["FIELD1", "RELATEDFIELD2", "REGEX", "TABLECELLS"]
      # data.fields_data.each do |field|
      #   assert fieldNames.include? field.name
      #   if field.name == "TABLECELLS"
      #     assert field.page_area.page_table_area.column_count == 4
      #     assert field.page_area.page_table_area.row_count == 3
      #   end
      # end
    end

    def test_parse_document_file_not_found_result
      parse_options = ParseOptions.new
      file = TestFile.not_exist
      parse_options.file_info = file.file_info
      parse_options.template = TestParserParseApi.get_template
      request = ParseRequest.new(parse_options)

      error = assert_raises ApiClientError do
        @parse_api.parse(request)
      end

      assert error.message.include? "Can't find file located at 'folder/file-not-exist.pdf'."
    end

    def test_ai_parse
      test_file = TestFile.invoice
      options = AIParseOptions.new
      options.file_info = test_file.file_info
      options.template = {
        "InvoiceNum" => "",
        "Date" => "",
        "Email" => ""
      }
      request = AIParseRequest.new(options)
      result = @parse_api.a_i_parse(request)
      puts result
      assert result != nil
    end

    def test_parse_document_incorrect_password
      parse_options = ParseOptions.new
      file = TestFile.password_protected
      file.password = "123"
      parse_options.file_info = file.file_info
      parse_options.template = TestParserParseApi.get_template
      request = ParseRequest.new(parse_options)

      error = assert_raises ApiClientError do
        @parse_api.parse(request)
      end

      assert error.message.include? "Password provided for file 'words/docx/password-protected.docx' is incorrect."
    end

    def self.get_template
      field1 = Field.new
      field1.field_name = "Field1"
      field1.page_index = 4
      fieldPosition1 = FieldPosition.new
      fieldPosition1.field_position_type = "Fixed"
      rect1 = Rectangle.new({ "Size" => Size.new({ "Height" => 30, "Width" => 140 }), "Position" => Point.new({ "X" => 0, "Y" => 0 }) })
      fieldPosition1.rectangle = rect1
      field1.field_position = fieldPosition1

      field2 = Field.new
      field2.field_name = "RelatedField2"
      fieldPosition2 = FieldPosition.new
      fieldPosition2.field_position_type = "Linked"
      fieldPosition2.linked_field_name = "Field1"
      fieldPosition2.is_bottom_linked = true
      fieldPosition2.is_right_linked = true
      searchArea = Size.new
      searchArea.width = 209
      searchArea.height = 24
      fieldPosition2.search_area = searchArea
      fieldPosition2.auto_scale = false
      field2.field_position = fieldPosition2

      field3 = Field.new
      field3.field_name = "Regex"
      fieldPosition3 = FieldPosition.new
      fieldPosition3.field_position_type = "Regex"
      fieldPosition3.regex = "REGEX TEXT 123"
      field3.field_position = fieldPosition3

      table = Table.new
      table.table_name = "TableCells"
      table.page_index = 5
      detectorparams = DetectorParameters.new
      rect = Rectangle.new({ "Size" => Size.new({ "Height" => 400, "Width" => 600 }), "Position" => Point.new({ "X" => 0, "Y" => 0 }) })
      detectorparams.rectangle = rect
      table.detector_parameters = detectorparams

      fields = [field1, field2, field3]
      tables = [table]
      options = Template.new
      options.fields = fields
      options.tables = tables
      options
    end
  end
end
