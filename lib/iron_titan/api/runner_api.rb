=begin
Titan API

The ultimate, language agnostic, container based job processing framework.

OpenAPI spec version: 0.4.6

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
  class RunnerApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Mark job as failed.
    # Job is marked as failed if it was in a valid state. Job's `finished_at` time is initialized.
    # @param name Name of group for this set of jobs.
    # @param id Job id
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [JobWrapper]
    def groups_name_jobs_id_error_post(name, id, body, opts = {})
      data, _status_code, _headers = groups_name_jobs_id_error_post_with_http_info(name, id, body, opts)
      return data
    end

    # Mark job as failed.
    # Job is marked as failed if it was in a valid state. Job&#39;s &#x60;finished_at&#x60; time is initialized.
    # @param name Name of group for this set of jobs.
    # @param id Job id
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(JobWrapper, Fixnum, Hash)>] JobWrapper data, response status code and response headers
    def groups_name_jobs_id_error_post_with_http_info(name, id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: RunnerApi.groups_name_jobs_id_error_post ..."
      end
      # verify the required parameter 'name' is set
      fail ArgumentError, "Missing the required parameter 'name' when calling RunnerApi.groups_name_jobs_id_error_post" if name.nil?
      # verify the required parameter 'id' is set
      fail ArgumentError, "Missing the required parameter 'id' when calling RunnerApi.groups_name_jobs_id_error_post" if id.nil?
      # verify the required parameter 'body' is set
      fail ArgumentError, "Missing the required parameter 'body' when calling RunnerApi.groups_name_jobs_id_error_post" if body.nil?
      # resource path
      local_var_path = "/groups/{name}/jobs/{id}/error".sub('{format}','json').sub('{' + 'name' + '}', name.to_s).sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'JobWrapper')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RunnerApi#groups_name_jobs_id_error_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Mark job as started, ie: status = 'running'
    # Job status is changed to 'running' if it was in a valid state before. Job's `started_at` time is initialized.
    # @param name Name of group for this set of jobs.
    # @param id Job id
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [JobWrapper]
    def groups_name_jobs_id_start_post(name, id, body, opts = {})
      data, _status_code, _headers = groups_name_jobs_id_start_post_with_http_info(name, id, body, opts)
      return data
    end

    # Mark job as started, ie: status &#x3D; &#39;running&#39;
    # Job status is changed to &#39;running&#39; if it was in a valid state before. Job&#39;s &#x60;started_at&#x60; time is initialized.
    # @param name Name of group for this set of jobs.
    # @param id Job id
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(JobWrapper, Fixnum, Hash)>] JobWrapper data, response status code and response headers
    def groups_name_jobs_id_start_post_with_http_info(name, id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: RunnerApi.groups_name_jobs_id_start_post ..."
      end
      # verify the required parameter 'name' is set
      fail ArgumentError, "Missing the required parameter 'name' when calling RunnerApi.groups_name_jobs_id_start_post" if name.nil?
      # verify the required parameter 'id' is set
      fail ArgumentError, "Missing the required parameter 'id' when calling RunnerApi.groups_name_jobs_id_start_post" if id.nil?
      # verify the required parameter 'body' is set
      fail ArgumentError, "Missing the required parameter 'body' when calling RunnerApi.groups_name_jobs_id_start_post" if body.nil?
      # resource path
      local_var_path = "/groups/{name}/jobs/{id}/start".sub('{format}','json').sub('{' + 'name' + '}', name.to_s).sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'JobWrapper')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RunnerApi#groups_name_jobs_id_start_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Mark job as succeeded.
    # Job status is changed to succeeded if it was in a valid state before. Job's `completed_at` time is initialized.
    # @param name Name of group for this set of jobs.
    # @param id Job id
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [JobWrapper]
    def groups_name_jobs_id_success_post(name, id, body, opts = {})
      data, _status_code, _headers = groups_name_jobs_id_success_post_with_http_info(name, id, body, opts)
      return data
    end

    # Mark job as succeeded.
    # Job status is changed to succeeded if it was in a valid state before. Job&#39;s &#x60;completed_at&#x60; time is initialized.
    # @param name Name of group for this set of jobs.
    # @param id Job id
    # @param body 
    # @param [Hash] opts the optional parameters
    # @return [Array<(JobWrapper, Fixnum, Hash)>] JobWrapper data, response status code and response headers
    def groups_name_jobs_id_success_post_with_http_info(name, id, body, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: RunnerApi.groups_name_jobs_id_success_post ..."
      end
      # verify the required parameter 'name' is set
      fail ArgumentError, "Missing the required parameter 'name' when calling RunnerApi.groups_name_jobs_id_success_post" if name.nil?
      # verify the required parameter 'id' is set
      fail ArgumentError, "Missing the required parameter 'id' when calling RunnerApi.groups_name_jobs_id_success_post" if id.nil?
      # verify the required parameter 'body' is set
      fail ArgumentError, "Missing the required parameter 'body' when calling RunnerApi.groups_name_jobs_id_success_post" if body.nil?
      # resource path
      local_var_path = "/groups/{name}/jobs/{id}/success".sub('{format}','json').sub('{' + 'name' + '}', name.to_s).sub('{' + 'id' + '}', id.to_s)

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
        :return_type => 'JobWrapper')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: RunnerApi#groups_name_jobs_id_success_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
