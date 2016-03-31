=begin
Titan API

The ultimate, language agnostic, container based job processing framework.

OpenAPI spec version: 0.2.8

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

require 'spec_helper'
require 'json'

# Unit tests for IronTitan::CoreApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'CoreApi' do
  before do
    # run before each test
    @instance = IronTitan::CoreApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CoreApi' do
    it 'should create an instact of CoreApi' do
      @instance.should be_a(IronTitan::CoreApi)
    end
  end

  # unit tests for job_id_delete
  # Delete the job.
  # Delete only succeeds if job status is one of `succeeded\n| failed | cancelled`. Cancel a job if it is another state and needs to\nbe deleted.  All information about the job, including the log, is\nirretrievably lost when this is invoked.
  # @param id Job id
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'job_id_delete test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for job_id_get
  # Gets job by id
  # Gets a job by id.
  # @param id Job id
  # @param [Hash] opts the optional parameters
  # @return [JobWrapper]
  describe 'job_id_get test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for jobs_consume_get
  # Get next job.
  # Gets the next job in the queue, ready for processing. Titan may return &lt;=n jobs. Consumers should start processing jobs in order. Each returned job is set to `status` \&quot;running\&quot; and `started_at` is set to the current time. No other consumer can retrieve this job.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :n Number of jobs to return.
  # @return [JobsWrapper]
  describe 'jobs_consume_get test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

  # unit tests for jobs_post
  # Enqueue Job
  # Enqueues job(s). If any of the jobs is invalid, none of the jobs are enqueued.
  # @param body Array of jobs to post.
  # @param [Hash] opts the optional parameters
  # @return [JobsWrapper]
  describe 'jobs_post test' do
    it "should work" do
      # assertion here
      # should be_a()
      # should be_nil
      # should ==
      # should_not ==
    end
  end

end
