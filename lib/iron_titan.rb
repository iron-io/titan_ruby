=begin
Titan API

The ultimate, language agnostic, container based job processing framework.

OpenAPI spec version: 0.3.8

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

# Common files
require 'iron_titan/api_client'
require 'iron_titan/api_error'
require 'iron_titan/version'
require 'iron_titan/configuration'

# Models
require 'iron_titan/models/complete'
require 'iron_titan/models/error'
require 'iron_titan/models/error_body'
require 'iron_titan/models/group'
require 'iron_titan/models/group_wrapper'
require 'iron_titan/models/groups_wrapper'
require 'iron_titan/models/id_status'
require 'iron_titan/models/job'
require 'iron_titan/models/job_wrapper'
require 'iron_titan/models/jobs_wrapper'
require 'iron_titan/models/new_job'
require 'iron_titan/models/new_jobs_wrapper'
require 'iron_titan/models/start'

# APIs
require 'iron_titan/api/groups_api'
require 'iron_titan/api/jobs_api'
require 'iron_titan/api/runner_api'

module IronTitan
  class << self
    # Customize default settings for the SDK using block.
    #   IronTitan.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
