module Teamify
  class Railtie < Rails::Railtie
    initializer "teamify.extend_active_record" do
      ActiveSupport.on_load(:active_record) do
        extend Teamify::Models
      end
    end

    initializer "teamify.extend_action_dispatch" do
      ActionDispatch::Routing::Mapper.include Teamify::RoutingMapper
    end
  end
end
