# encoding: utf-8

module Cql
  module Protocol
    class EventResponse < ResultResponse
      def self.decode!(protocol_version, buffer, trace_id=nil)
        type = read_string!(buffer)
        impl = EVENT_TYPES[type]
        raise UnsupportedEventTypeError, %(Unsupported event type: "#{type}") unless impl
        impl.decode!(protocol_version, buffer, trace_id)
      end

      private

      RESPONSE_TYPES[0x0c] = self

      EVENT_TYPES = {
        # populated by subclasses
      }
    end
  end
end
