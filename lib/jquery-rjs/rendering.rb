require 'action_view/helpers/rendering_helper'

module JqueryRjs::RenderingHelper
  method_name = "render#{'_with_update' if JqueryRjs.use_alias_method_chain?}"
  define_method(method_name) do |options = {}, locals = {}, &block|
    if options == :update
      update_page(&block)
    else
      args = options, locals, block
      JqueryRjs.use_alias_method_chain? ? render_without_update(*args) : super(*args)
    end
  end
end


if JqueryRjs.use_alias_method_chain?
  ActionView::Helpers::RenderingHelper.module_eval do
    include JqueryRjs::RenderingHelper
    alias_method_chain :render, :update
  end
else
  ActionView::Helpers::RenderingHelper.prepend(JqueryRjs::RenderingHelper)
end
