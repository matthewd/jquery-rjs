module ActionView
  module Template::Handlers
    class RJS
      # Default format used by RJS.
      class_attribute :default_format
      self.default_format = Mime[:js]

      def call(template, source=nil)
        source ||= template.source
        "update_page do |page|;#{source}\nend"
      end
    end
  end
end

