module Teamify
  class Engine < ::Rails::Engine
    isolate_namespace Teamify

    initializer 'teamify.extend_active_record' do
      ActiveSupport.on_load(:active_record) do
        include Teamify::Models
      end
    end
  end
end
