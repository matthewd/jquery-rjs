require 'rails'
require 'active_support'

unless defined? JQUERY_VAR
  JQUERY_VAR = '$'
end

module JqueryRjs
  def use_alias_method_chain?
    @use_alias_method_chain ||= RUBY_VERSION < '2'
  end
  module_function :use_alias_method_chain?

  class Engine < Rails::Engine
    initializer 'jquery-rjs.initialize' do
      ActiveSupport.on_load(:action_controller) do
        require 'jquery-rjs/on_load_action_controller'
      end

      ActiveSupport.on_load(:action_view) do
        require 'jquery-rjs/on_load_action_view'
      end
    end
  end
end

