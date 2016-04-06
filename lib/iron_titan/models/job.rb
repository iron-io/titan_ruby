=begin
Titan API

The ultimate, language agnostic, container based job processing framework.

OpenAPI spec version: 0.3.2

Generated by: https://github.com/swagger-api/swagger-codegen.git


=end

require 'date'

module IronTitan
  class Job
    # Name of image to use.
    attr_accessor :image

    # Payload for the job. This is what you pass into each job to make it do something.
    attr_accessor :payload

    # Number of seconds to wait before queueing the job for consumption for the first time. Must be a positive integer. Jobs with a delay start in state \"delayed\" and transition to \"running\" after delay seconds.
    attr_accessor :delay

    # Maximum runtime in seconds. If a consumer retrieves the\njob, but does not change it's status within timeout seconds, the job\nis considered failed, with reason timeout (Titan may allow a small\ngrace period). The consumer should also kill the job after timeout\nseconds. If a consumer tries to change status after Titan has already\ntimed out the job, the consumer will be ignored.\n
    attr_accessor :timeout

    # Priority of the job. Higher has more priority. 3 levels from 0-2. Jobs at same priority are processed in FIFO order.
    attr_accessor :priority

    # \"Number of automatic retries this job is allowed. A retry will be attempted if a task fails. Max 25. Automatic retries are performed by titan when a task reaches a failed state and has `max_retries` > 0. A retry is performed by queueing a new job with the same image id and payload. The new job's max_retries is one less than the original. The new job's `retry_of` field is set to the original Job ID.  Titan will delay the new job for retries_delay seconds before queueing it. Cancelled or successful tasks are never automatically retried.\"\n
    attr_accessor :max_retries

    # Time in seconds to wait before retrying the job. Must be a non-negative integer.
    attr_accessor :retries_delay

    # Unique identifier representing a specific job.
    attr_accessor :id

    # States and valid transitions.\n\n                 +---------+\n       +---------> delayed <----------------+\n                 +----+----+                |\n                      |                     |\n                      |                     |\n                 +----v----+                |\n       +---------> queued  <----------------+\n                 +----+----+                *\n                      |                     *\n                      |               retry * creates new job\n                 +----v----+                *\n                 | running |                *\n                 +--+-+-+--+                |\n          +---------|-|-|-----+-------------+\n      +---|---------+ | +-----|---------+   |\n      |   |           |       |         |   |\n+-----v---^-+      +--v-------^+     +--v---^-+\n| success   |      | cancelled |     |  error |\n+-----------+      +-----------+     +--------+\n\n* delayed - has a delay.\n* queued - Ready to be consumed when it's turn comes.\n* running - Currently consumed by a runner which will attempt to process it.\n* success - (or complete? success/error is common javascript terminology)\n* error - Something went wrong. In this case more information can be obtained\n  by inspecting the \"reason\" field.\n  - timeout\n  - killed - forcibly killed by worker due to resource restrictions or access\n    violations.\n  - bad_exit - exited with non-zero status due to program termination/crash.\n* cancelled - cancelled via API. More information in the reason field.\n  - client_request - Request was cancelled by a client.\n
    attr_accessor :status

    # Group this job belongs to. 
    attr_accessor :group_name

    attr_accessor :reason

    # Time when job was submitted. Always in UTC.
    attr_accessor :created_at

    # Time when job started execution. Always in UTC.
    attr_accessor :started_at

    # Time when job completed, whether it was successul or failed. Always in UTC.
    attr_accessor :completed_at

    # If this field is set, then this job is a retry of the ID in this field.
    attr_accessor :retry_of

    # If this field is set, then this job was retried by the job referenced in this field.
    attr_accessor :retry_id

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        
        :'image' => :'image',
        
        :'payload' => :'payload',
        
        :'delay' => :'delay',
        
        :'timeout' => :'timeout',
        
        :'priority' => :'priority',
        
        :'max_retries' => :'max_retries',
        
        :'retries_delay' => :'retries_delay',
        
        :'id' => :'id',
        
        :'status' => :'status',
        
        :'group_name' => :'group_name',
        
        :'reason' => :'reason',
        
        :'created_at' => :'created_at',
        
        :'started_at' => :'started_at',
        
        :'completed_at' => :'completed_at',
        
        :'retry_of' => :'retry_of',
        
        :'retry_id' => :'retry_id'
        
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'image' => :'String',
        :'payload' => :'String',
        :'delay' => :'Integer',
        :'timeout' => :'Integer',
        :'priority' => :'Integer',
        :'max_retries' => :'Integer',
        :'retries_delay' => :'Integer',
        :'id' => :'String',
        :'status' => :'String',
        :'group_name' => :'String',
        :'reason' => :'Reason',
        :'created_at' => :'DateTime',
        :'started_at' => :'DateTime',
        :'completed_at' => :'DateTime',
        :'retry_of' => :'String',
        :'retry_id' => :'String'
        
      }
    end

    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.inject({}){|memo,(k,v)| memo[k.to_sym] = v; memo}

      
      if attributes[:'image']
        self.image = attributes[:'image']
      end
      
      if attributes[:'payload']
        self.payload = attributes[:'payload']
      end
      
      if attributes[:'delay']
        self.delay = attributes[:'delay']
      else
        self.delay = 0
      end
      
      if attributes[:'timeout']
        self.timeout = attributes[:'timeout']
      else
        self.timeout = 60
      end
      
      if attributes[:'priority']
        self.priority = attributes[:'priority']
      else
        self.priority = 0
      end
      
      if attributes[:'max_retries']
        self.max_retries = attributes[:'max_retries']
      else
        self.max_retries = 3
      end
      
      if attributes[:'retries_delay']
        self.retries_delay = attributes[:'retries_delay']
      else
        self.retries_delay = 60
      end
      
      if attributes[:'id']
        self.id = attributes[:'id']
      end
      
      if attributes[:'status']
        self.status = attributes[:'status']
      end
      
      if attributes[:'group_name']
        self.group_name = attributes[:'group_name']
      end
      
      if attributes[:'reason']
        self.reason = attributes[:'reason']
      end
      
      if attributes[:'created_at']
        self.created_at = attributes[:'created_at']
      end
      
      if attributes[:'started_at']
        self.started_at = attributes[:'started_at']
      end
      
      if attributes[:'completed_at']
        self.completed_at = attributes[:'completed_at']
      end
      
      if attributes[:'retry_of']
        self.retry_of = attributes[:'retry_of']
      end
      
      if attributes[:'retry_id']
        self.retry_id = attributes[:'retry_id']
      end
      
    end

    # Custom attribute writer method checking allowed values (enum).
    def status=(status)
      allowed_values = ["delayed", "queued", "running", "success", "error", "cancelled"]
      if status && !allowed_values.include?(status)
        fail "invalid value for 'status', must be one of #{allowed_values}"
      end
      @status = status
    end

    # Check equality by comparing each attribute.
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          image == o.image &&
          payload == o.payload &&
          delay == o.delay &&
          timeout == o.timeout &&
          priority == o.priority &&
          max_retries == o.max_retries &&
          retries_delay == o.retries_delay &&
          id == o.id &&
          status == o.status &&
          group_name == o.group_name &&
          reason == o.reason &&
          created_at == o.created_at &&
          started_at == o.started_at &&
          completed_at == o.completed_at &&
          retry_of == o.retry_of &&
          retry_id == o.retry_id
    end

    # @see the `==` method
    def eql?(o)
      self == o
    end

    # Calculate hash code according to all attributes.
    def hash
      [image, payload, delay, timeout, priority, max_retries, retries_delay, id, status, group_name, reason, created_at, started_at, completed_at, retry_of, retry_id].hash
    end

    # build the object from hash
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          else
            #TODO show warning in debug mode
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        else
          # data not found in attributes(hash), not an issue as the data can be optional
        end
      end

      self
    end

    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /^(true|t|yes|y|1)$/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        _model = IronTitan.const_get(type).new
        _model.build_from_hash(value)
      end
    end

    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_body (backward compatibility))
    def to_body
      to_hash
    end

    # return the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Method to output non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map{ |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
