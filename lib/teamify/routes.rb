module Teamify
  module Routes
    def self.draw_routes(mapper, mapping_name, opts = {})
      mapper.resources mapping_name, teamify_options(mapping_name).merge(opts)
    end

    class << self
      private

      def teamify_options(mapping_name)
        case mapping_name
        when :teams
          {controller: :teams}
        when :memberships
          {controller: :memberships}
        when :members
          {controller: :members}
        else
          raise "Teamify:: invalid route mapping_name '#{mapping_name}'"
        end
      end
    end
  end
end
