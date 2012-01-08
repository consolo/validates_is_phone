gem 'activerecord', '>= 2.3'

##
# &copy; 2006 Andrew Coleman
# Released under MIT license.
# http://www.opensource.org/licenses/mit-license.php
#
module Consolo
  module ValidatesIsPhone
    def validates_is_phone(*attr_names)
      configuration = { 
        :required_message => "is required", 
        :format_message => "must be formated XXXXXXXXXX (10/11 digits)", 
        :required => false
      }
      configuration.update(attr_names.pop) if attr_names.last.is_a?(Hash)
      
      validates_each(attr_names, configuration) do |record, attr_name, value|
        if value.nil? or value == ''
          if configuration[:required]
            record.errors.add(attr_name, configuration[:required_message])
          end
        else
          value.gsub!(/[^\d]/,'')
          if value.length != 10 and value.length != 11
            record.errors.add(attr_name, configuration[:format_message])
          end
        end
      end
    end
  end
end

ActiveRecord::Base.send :extend, Consolo::ValidatesIsPhone
