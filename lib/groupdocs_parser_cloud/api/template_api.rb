# -----------------------------------------------------------------------------------
# <copyright company="Aspose Pty Ltd" file="template.rb">
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
# -----------------------------------------------------------------------------------

require 'uri'
require 'date'

module GroupDocsParserCloud
  #
  # GroupDocs.Parser Cloud API
  #
  class TemplateApi
    attr_accessor :config

    #make TemplateApi.new private 
    private_class_method :new

    # Initializes new instance of TemplateApi
    #
    # @param [config] Configuration 
    # @return [TemplateApi] New instance of TemplateApi
    def initialize(config)
      @config = config
      @api_client = ApiClient.new(config)
      @access_token = nil
    end

    # Initializes new instance of TemplateApi
    #
    # @param [app_sid] Application identifier (App SID)
    # @param [app_key] Application private key (App Key)
    # @return [TemplateApi] New instance of TemplateApi
    def self.from_keys(app_sid, app_key)
      config = Configuration.new(app_sid, app_key)
      return new(config)
    end

    # Initializes new instance of TemplateApi
    #
    # @param [config] Configuration 
    # @return [TemplateApi] New instance of TemplateApi
    def self.from_config(config)
      return new(config)
    end

    # Create or update document template.
    # 
    # @param request create_template_request
    # @return [TemplateResult]
    def create_template(request)
      data, _status_code, _headers = create_template_with_http_info(request)
      data
    end

    # Create or update document template.
    # 
    # @param request create_template_request
    # @return [Array<(TemplateResult, Fixnum, Hash)>]
    # TemplateResult data, response status code and response headers
    def create_template_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? CreateTemplateRequest

      @api_client.config.logger.debug 'Calling API: TemplateApi.create_template ...' if @api_client.config.debugging
      # verify the required parameter 'options' is set
      raise ArgumentError, 'Missing the required parameter options when calling TemplateApi.create_template' if @api_client.config.client_side_validation && request.options.nil?
      # resource path
      local_var_path = '/parser/template'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.options)
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'TemplateResult')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        TemplateApi#create_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Delete document template.
    # 
    # @param request delete_template_request
    # @return [nil]
    def delete_template(request)
      delete_template_with_http_info(request)
      nil
    end

    # Delete document template.
    # 
    # @param request delete_template_request
    # @return [Array<(nil, Fixnum, Hash)>]
    # nil, response status code and response headers
    def delete_template_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? DeleteTemplateRequest

      @api_client.config.logger.debug 'Calling API: TemplateApi.delete_template ...' if @api_client.config.debugging
      # verify the required parameter 'options' is set
      raise ArgumentError, 'Missing the required parameter options when calling TemplateApi.delete_template' if @api_client.config.client_side_validation && request.options.nil?
      # resource path
      local_var_path = '/parser/template'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.options)
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        TemplateApi#delete_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    # Retrieve document template.
    # 
    # @param request get_template_request
    # @return [Template]
    def get_template(request)
      data, _status_code, _headers = get_template_with_http_info(request)
      data
    end

    # Retrieve document template.
    # 
    # @param request get_template_request
    # @return [Array<(Template, Fixnum, Hash)>]
    # Template data, response status code and response headers
    def get_template_with_http_info(request)
      raise ArgumentError, 'Incorrect request type' unless request.is_a? GetTemplateRequest

      @api_client.config.logger.debug 'Calling API: TemplateApi.get_template ...' if @api_client.config.debugging
      # verify the required parameter 'options' is set
      raise ArgumentError, 'Missing the required parameter options when calling TemplateApi.get_template' if @api_client.config.client_side_validation && request.options.nil?
      # resource path
      local_var_path = '/parser/template'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(request.options)
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
                                                        header_params: header_params,
                                                        query_params: query_params,
                                                        form_params: form_params,
                                                        body: post_body,
                                                        access_token: get_access_token,
                                                        return_type: 'Template')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called:
        TemplateApi#get_template\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      [data, status_code, headers]
    end

    #
    # Helper method to convert first letter to downcase
    #
    private def downcase_first_letter(str)
      value = str[0].downcase + str[1..-1]
      value
    end
                 
    #
    # Retrieves access token
    #
    private def get_access_token
        if @access_token.nil? then
          request_access_token
        end
        
        @access_token  
    end

    #
    # Gets a access token from server
    #
    private def request_access_token
        auth_config = Configuration.new(@config.app_sid, @config.app_key)
        auth_config.api_base_url = @config.api_base_url
        auth_config.debugging = @config.debugging
        auth_config.logger = @config.logger
        auth_config.temp_folder_path = @config.temp_folder_path
        auth_config.client_side_validation = @config.client_side_validation
        auth_config.api_version = ''

        auth_api_client = ApiClient.new(auth_config)

        request_url = "/connect/token"
        post_data = "grant_type=client_credentials&client_id=#{@config.app_sid}&client_secret=#{@config.app_key}"

        data, _status_code, _header = auth_api_client.call_api(:POST, request_url, :body => post_data, :return_type => 'Object')
        
        @access_token = data[:access_token]

        expires_in_seconds = data[:expires_in].to_i - 5 * 60 
        expires_in_days = Rational(expires_in_seconds, 60 * 60 * 24)
        @access_token_expires_at = DateTime.now + expires_in_days
    end
    
    # requires all files inside a directory from current dir
    # @param _dir can be relative path like '/lib' or "../lib"
    private def require_all(_dir)
      Dir[File.expand_path(File.join(File.dirname(File.absolute_path(__FILE__)), _dir)) + "/*.rb"].each do |file|
        require file
      end
    end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="create_template_request.rb">
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
 # --------------------------------------------------------------------------------------------------------------------
 #

module GroupDocsParserCloud

  #
  # Request model for create_template operation.
  #
  class CreateTemplateRequest

        # Create template options.
        attr_accessor :options
	
        #
        # Initializes a new instance.
        # @param options Create template options.
        def initialize(options)
           self.options = options
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="delete_template_request.rb">
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
 # --------------------------------------------------------------------------------------------------------------------
 #

module GroupDocsParserCloud

  #
  # Request model for delete_template operation.
  #
  class DeleteTemplateRequest

        # Delete template options.
        attr_accessor :options
	
        #
        # Initializes a new instance.
        # @param options Delete template options.
        def initialize(options)
           self.options = options
        end
  end
end
 #
 # --------------------------------------------------------------------------------------------------------------------
 # <copyright company="Aspose Pty Ltd" file="get_template_request.rb">
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
 # --------------------------------------------------------------------------------------------------------------------
 #

module GroupDocsParserCloud

  #
  # Request model for get_template operation.
  #
  class GetTemplateRequest

        # Retrieve template options.
        attr_accessor :options
	
        #
        # Initializes a new instance.
        # @param options Retrieve template options.
        def initialize(options)
           self.options = options
        end
  end
end
