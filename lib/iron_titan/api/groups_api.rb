=begin
Titan API

The ultimate, language agnostic, container based job processing framework.

OpenAPI spec version: 0.4.4

Generated by: https://github.com/swagger-api/swagger-codegen.git

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=end

require "uri"

module IronTitan
  class GroupsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Get all group names.
    # Get a list of all the groups in the system.
    # @param [Hash] opts the optional parameters
    # @return [GroupsWrapper]
    def groups_get(opts = {})
      data, _status_code, _headers = groups_get_with_http_info(opts)
      return data
    end

    # Get all group names.
    # Get a list of all the groups in the system.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GroupsWrapper, Fixnum, Hash)>] GroupsWrapper data, response status code and response headers
    def groups_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupsApi.groups_get ..."
      end
      # resource path
      local_var_path = "/groups".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GroupsWrapper')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupsApi#groups_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get information for a group.
    # This gives more details about a job group, such as statistics.
    # @param name name of the group.
    # @param [Hash] opts the optional parameters
    # @return [GroupWrapper]
    def groups_name_get(name, opts = {})
      data, _status_code, _headers = groups_name_get_with_http_info(name, opts)
      return data
    end

    # Get information for a group.
    # This gives more details about a job group, such as statistics.
    # @param name name of the group.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GroupWrapper, Fixnum, Hash)>] GroupWrapper data, response status code and response headers
    def groups_name_get_with_http_info(name, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupsApi.groups_name_get ..."
      end
      # verify the required parameter 'name' is set
      fail ArgumentError, "Missing the required parameter 'name' when calling GroupsApi.groups_name_get" if name.nil?
      # resource path
      local_var_path = "/groups/{name}".sub('{format}','json').sub('{' + 'name' + '}', name.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
            auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GroupWrapper')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupsApi#groups_name_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Create/update a job group.
    # You can set group level settings here. 
    # @param body Group to post.
    # @param [Hash] opts the optional parameters
    # @return [GroupWrapper]
    def groups_name_put(body, opts = {})
      data, _status_code, _headers = groups_name_put_with_http_info(body, opts)
      return data
    end

    # Create/update a job group.
    # You can set group level settings here. 
    # @param body Group to post.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GroupWrapper, Fixnum, Hash)>] GroupWrapper data, response status code and response headers
    def groups_name_put_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupsApi.groups_name_put ..."
      end
      # verify the required parameter 'body' is set
      fail ArgumentError, "Missing the required parameter 'body' when calling GroupsApi.groups_name_put" if body.nil?
      # resource path
      local_var_path = "/groups/{name}".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GroupWrapper')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupsApi#groups_name_put\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Post new group
    # Insert a new job group
    # @param body Group to post.
    # @param [Hash] opts the optional parameters
    # @return [GroupWrapper]
    def groups_post(body, opts = {})
      data, _status_code, _headers = groups_post_with_http_info(body, opts)
      return data
    end

    # Post new group
    # Insert a new job group
    # @param body Group to post.
    # @param [Hash] opts the optional parameters
    # @return [Array<(GroupWrapper, Fixnum, Hash)>] GroupWrapper data, response status code and response headers
    def groups_post_with_http_info(body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: GroupsApi.groups_post ..."
      end
      # verify the required parameter 'body' is set
      fail ArgumentError, "Missing the required parameter 'body' when calling GroupsApi.groups_post" if body.nil?
      # resource path
      local_var_path = "/groups".sub('{format}','json')

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}

      # HTTP header 'Accept' (if needed)
      local_header_accept = ['application/json']
      local_header_accept_result = @api_client.select_header_accept(local_header_accept) and header_params['Accept'] = local_header_accept_result

      # HTTP header 'Content-Type'
      local_header_content_type = ['application/json']
      header_params['Content-Type'] = @api_client.select_header_content_type(local_header_content_type)

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(body)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'GroupWrapper')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: GroupsApi#groups_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
