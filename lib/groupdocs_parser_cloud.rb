# ------------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="groupdocs_parser_cloud.rb">
#   Copyright (c) 2003-2019 Aspose Pty Ltd
# </copyright>
# <summary>
#  Permission is hereby granted, free of charge, to any person obtaining a copy
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
# ------------------------------------------------------------------------------------

# Common files
require_relative 'groupdocs_parser_cloud/api_client'
require_relative 'groupdocs_parser_cloud/api_error'
require_relative 'groupdocs_parser_cloud/version'
require_relative 'groupdocs_parser_cloud/configuration'

# Models
require_relative 'groupdocs_parser_cloud/models/container_item'
require_relative 'groupdocs_parser_cloud/models/container_item_info'
require_relative 'groupdocs_parser_cloud/models/container_result'
require_relative 'groupdocs_parser_cloud/models/coordinates'
require_relative 'groupdocs_parser_cloud/models/create_template_options'
require_relative 'groupdocs_parser_cloud/models/detector_parameters'
require_relative 'groupdocs_parser_cloud/models/disc_usage'
require_relative 'groupdocs_parser_cloud/models/error'
require_relative 'groupdocs_parser_cloud/models/error_details'
require_relative 'groupdocs_parser_cloud/models/field'
require_relative 'groupdocs_parser_cloud/models/field_data'
require_relative 'groupdocs_parser_cloud/models/field_position'
require_relative 'groupdocs_parser_cloud/models/file_info'
require_relative 'groupdocs_parser_cloud/models/file_type'
require_relative 'groupdocs_parser_cloud/models/file_versions'
require_relative 'groupdocs_parser_cloud/models/files_list'
require_relative 'groupdocs_parser_cloud/models/files_upload_result'
require_relative 'groupdocs_parser_cloud/models/format'
require_relative 'groupdocs_parser_cloud/models/formats_result'
require_relative 'groupdocs_parser_cloud/models/formatted_text_options'
require_relative 'groupdocs_parser_cloud/models/image'
require_relative 'groupdocs_parser_cloud/models/image_page'
require_relative 'groupdocs_parser_cloud/models/images_result'
require_relative 'groupdocs_parser_cloud/models/info_result'
require_relative 'groupdocs_parser_cloud/models/object_exist'
require_relative 'groupdocs_parser_cloud/models/page'
require_relative 'groupdocs_parser_cloud/models/page_area'
require_relative 'groupdocs_parser_cloud/models/page_table_area'
require_relative 'groupdocs_parser_cloud/models/page_table_area_cell'
require_relative 'groupdocs_parser_cloud/models/page_text_area'
require_relative 'groupdocs_parser_cloud/models/parse_result'
require_relative 'groupdocs_parser_cloud/models/parser_options'
require_relative 'groupdocs_parser_cloud/models/point'
require_relative 'groupdocs_parser_cloud/models/rectangle'
require_relative 'groupdocs_parser_cloud/models/size'
require_relative 'groupdocs_parser_cloud/models/storage_exist'
require_relative 'groupdocs_parser_cloud/models/storage_file'
require_relative 'groupdocs_parser_cloud/models/table'
require_relative 'groupdocs_parser_cloud/models/table_layout'
require_relative 'groupdocs_parser_cloud/models/template'
require_relative 'groupdocs_parser_cloud/models/template_options'
require_relative 'groupdocs_parser_cloud/models/template_result'
require_relative 'groupdocs_parser_cloud/models/text_page'
require_relative 'groupdocs_parser_cloud/models/text_result'
require_relative 'groupdocs_parser_cloud/models/text_style'
require_relative 'groupdocs_parser_cloud/models/container_options'
require_relative 'groupdocs_parser_cloud/models/file_version'
require_relative 'groupdocs_parser_cloud/models/images_options'
require_relative 'groupdocs_parser_cloud/models/info_options'
require_relative 'groupdocs_parser_cloud/models/parse_options'
require_relative 'groupdocs_parser_cloud/models/text_options'

# APIs
require_relative 'groupdocs_parser_cloud/api/file_api'
require_relative 'groupdocs_parser_cloud/api/folder_api'
require_relative 'groupdocs_parser_cloud/api/info_api'
require_relative 'groupdocs_parser_cloud/api/parse_api'
require_relative 'groupdocs_parser_cloud/api/storage_api'
require_relative 'groupdocs_parser_cloud/api/template_api'
