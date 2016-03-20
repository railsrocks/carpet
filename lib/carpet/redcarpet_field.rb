require 'redcarpet'
## The module for the Carpet gem.
module Carpet
  ## The module for fields to be parsd.
  module RedcarpetField
    extend ActiveSupport::Concern
    ## The methods that are found in the model.
    module ClassMethods
      def redcarpet_field(*fields, render_opts: {})
        fields.each do |field|
          define_method "parsed_#{field}" do
            # This is the method seen in the model. So it maight be parsed_name
            # or something.
            Carpet::Parsing.parse(read_attribute(field), render_opts: render_opts)
          end # End defining the method dynamically.
        end # End the fields loop.
      end # End the redcarpet_field method.
    end # End the class methods module.
  end # End the redcarpetfield module.
  module Parsing
    def self.parse(text, render_opts: {})
      renderer = Redcarpet::Render::HTML.new(render_opts)
      markdown = Redcarpet::Markdown.new(renderer)
      markdown.render text
    end
  end # End the parsing module.
end # End the carpet module.

ActiveRecord::Base.send :include, Carpet::RedcarpetField
