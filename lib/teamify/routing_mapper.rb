module Teamify
  module RoutingMapper
    def teamify_for(mapping_name, opts = {})
      Teamify::Routes.draw_routes(self, mapping_name, opts)
    end
  end
end
