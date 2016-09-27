require 'action_view/helpers/rendering_helper'

module JqueryRjs::RenderingHelper
  method_name = "render#{'_with_update' if RUBY_VERSION < '2'}"
  define_method(method_name) do |options = {}, locals = {}, &block|
    if options == :update
      update_page(&block)
    else
      args = options, locals, block
      RUBY_VERSION < '2' ? render_without_update(*args) : super(*args)
    end
  end
end


if RUBY_VERSION < '2'
  ActionView::Helpers::RenderingHelper.module_eval do
    include JqueryRjs::RenderingHelper
    alias_method_chain :render, :update
  end
else
  ActionView::Helpers::RenderingHelper.prepend(JqueryRjs::RenderingHelper)
end
