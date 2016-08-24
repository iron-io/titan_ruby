=begin
#IronWorker CE API

#The ultimate, language agnostic, container based task processing framework.

OpenAPI spec version: 0.5.2

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

require 'date'

module IronWorker

  class Task
    # Name of Docker image to use. This is optional and can be used to override the image defined at the group level.
    attr_accessor :image

    # Payload for the task. This is what you pass into each task to make it do something.
    attr_accessor :payload

    # Number of seconds to wait before queueing the task for consumption for the first time. Must be a positive integer. Tasks with a delay start in state \"delayed\" and transition to \"running\" after delay seconds.
    attr_accessor :delay

    # Maximum runtime in seconds. If a consumer retrieves the task, but does not change it's status within timeout seconds, the task is considered failed, with reason timeout (Titan may allow a small grace period). The consumer should also kill the task after timeout seconds. If a consumer tries to change status after Titan has already timed out the task, the consumer will be ignored. 
    attr_accessor :timeout

    # Priority of the task. Higher has more priority. 3 levels from 0-2. Tasks at same priority are processed in FIFO order.
    attr_accessor :priority

    # \"Number of automatic retries this task is allowed.  A retry will be attempted if a task fails. Max 25. Automatic retries are performed by titan when a task reaches a failed state and has `max_retries` > 0. A retry is performed by queueing a new task with the same image id and payload. The new task's max_retries is one less than the original. The new task's `retry_of` field is set to the original Task ID. The old task's `retry_at` field is set to the new Task's ID.  Titan will delay the new task for retries_delay seconds before queueing it. Cancelled or successful tasks are never automatically retried.\" 
    attr_accessor :max_retries

    # Time in seconds to wait before retrying the task. Must be a non-negative integer.
    attr_accessor :retries_delay

    # Unique identifier representing a specific task.
    attr_accessor :id

    # States and valid transitions.                   +---------+        +---------> delayed <----------------+                  +----+----+                |                       |                     |                       |                     |                  +----v----+                |        +---------> queued  <----------------+                  +----+----+                *                       |                     *                       |               retry * creates new task                  +----v----+                *                  | running |                *                  +--+-+-+--+                |           +---------|-|-|-----+-------------+       +---|---------+ | +-----|---------+   |       |   |           |       |         |   | +-----v---^-+      +--v-------^+     +--v---^-+ | success   |      | cancelled |     |  error | +-----------+      +-----------+     +--------+  * delayed - has a delay. * queued - Ready to be consumed when it's turn comes. * running - Currently consumed by a runner which will attempt to process it. * success - (or complete? success/error is common javascript terminology) * error - Something went wrong. In this case more information can be obtained   by inspecting the \"reason\" field.   - timeout   - killed - forcibly killed by worker due to resource restrictions or access     violations.   - bad_exit - exited with non-zero status due to program termination/crash. * cancelled - cancelled via API. More information in the reason field.   - client_request - Request was cancelled by a client. 
    attr_accessor :status

    # Group this task belongs to.
    attr_accessor :group_name

    # The error message, if status is 'error'. This is errors due to things outside the task itself. Errors from user code will be found in the log.
    attr_accessor :error

    # Machine usable reason for task being in this state. Valid values for error status are `timeout | killed | bad_exit`. Valid values for cancelled status are `client_request`. For everything else, this is undefined. 
    attr_accessor :reason

    # Time when task was submitted. Always in UTC.
    attr_accessor :created_at

    # Time when task started execution. Always in UTC.
    attr_accessor :started_at

    # Time when task completed, whether it was successul or failed. Always in UTC.
    attr_accessor :completed_at

    # If this field is set, then this task is a retry of the ID in this field.
    attr_accessor :retry_of

    # If this field is set, then this task was retried by the task referenced in this field.
    attr_accessor :retry_at

    # Env vars for the task. Comes from the ones set on the Group.
    attr_accessor :env_vars

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

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
        :'error' => :'error',
        :'reason' => :'reason',
        :'created_at' => :'created_at',
        :'started_at' => :'started_at',
        :'completed_at' => :'completed_at',
        :'retry_of' => :'retry_of',
        :'retry_at' => :'retry_at',
        :'env_vars' => :'env_vars'
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
        :'error' => :'String',
        :'reason' => :'String',
        :'created_at' => :'DateTime',
        :'started_at' => :'DateTime',
        :'completed_at' => :'DateTime',
        :'retry_of' => :'String',
        :'retry_at' => :'String',
        :'env_vars' => :'Hash<String, String>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}){|(k,v), h| h[k.to_sym] = v}

      if attributes.has_key?(:'image')
        self.image = attributes[:'image']
      end

      if attributes.has_key?(:'payload')
        self.payload = attributes[:'payload']
      end

      if attributes.has_key?(:'delay')
        self.delay = attributes[:'delay']
      else
        self.delay = 0
      end

      if attributes.has_key?(:'timeout')
        self.timeout = attributes[:'timeout']
      else
        self.timeout = 60
      end

      if attributes.has_key?(:'priority')
        self.priority = attributes[:'priority']
      end

      if attributes.has_key?(:'max_retries')
        self.max_retries = attributes[:'max_retries']
      else
        self.max_retries = 0
      end

      if attributes.has_key?(:'retries_delay')
        self.retries_delay = attributes[:'retries_delay']
      else
        self.retries_delay = 60
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'status')
        self.status = attributes[:'status']
      end

      if attributes.has_key?(:'group_name')
        self.group_name = attributes[:'group_name']
      end

      if attributes.has_key?(:'error')
        self.error = attributes[:'error']
      end

      if attributes.has_key?(:'reason')
        self.reason = attributes[:'reason']
      end

      if attributes.has_key?(:'created_at')
        self.created_at = attributes[:'created_at']
      end

      if attributes.has_key?(:'started_at')
        self.started_at = attributes[:'started_at']
      end

      if attributes.has_key?(:'completed_at')
        self.completed_at = attributes[:'completed_at']
      end

      if attributes.has_key?(:'retry_of')
        self.retry_of = attributes[:'retry_of']
      end

      if attributes.has_key?(:'retry_at')
        self.retry_at = attributes[:'retry_at']
      end

      if attributes.has_key?(:'env_vars')
        if (value = attributes[:'env_vars']).is_a?(Array)
          self.env_vars = value
        end
      end

    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properies with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      return invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @image.nil?
      return false if @priority.nil?
      status_validator = EnumAttributeValidator.new('String', ["delayed", "queued", "running", "success", "error", "cancelled"])
      return false unless status_validator.valid?(@status)
      reason_validator = EnumAttributeValidator.new('String', ["timeout", "killed", "bad_exit", "client_request"])
      return false unless reason_validator.valid?(@reason)
      return true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] status Object to be assigned
    def status=(status)
      validator = EnumAttributeValidator.new('String', ["delayed", "queued", "running", "success", "error", "cancelled"])
      unless validator.valid?(status)
        fail ArgumentError, "invalid value for 'status', must be one of #{validator.allowable_values}."
      end
      @status = status
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] reason Object to be assigned
    def reason=(reason)
      validator = EnumAttributeValidator.new('String', ["timeout", "killed", "bad_exit", "client_request"])
      unless validator.valid?(reason)
        fail ArgumentError, "invalid value for 'reason', must be one of #{validator.allowable_values}."
      end
      @reason = reason
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
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
          error == o.error &&
          reason == o.reason &&
          created_at == o.created_at &&
          started_at == o.started_at &&
          completed_at == o.completed_at &&
          retry_of == o.retry_of &&
          retry_at == o.retry_at &&
          env_vars == o.env_vars
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [image, payload, delay, timeout, priority, max_retries, retries_delay, id, status, group_name, error, reason, created_at, started_at, completed_at, retry_of, retry_at, env_vars].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /^Array<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map{ |v| _deserialize($1, v) } )
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
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
        temp_model = IronWorker.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
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
