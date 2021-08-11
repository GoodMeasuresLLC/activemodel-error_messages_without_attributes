require "activemodel/error_messages_without_attributes/version"

require 'active_model'
require 'active_support'


module ActiveModel
  class Error
    singleton_class.alias_method :original_full_message, :full_message
    def self.full_message(attribute, message, base) # :nodoc:
      return message if attribute == base
      if message =~ /\A\^/
        I18n.t(:"errors.format.full_message",
          default: "%{message}",
          message:  message[1..-1]
        )
      else
        original_full_message(attribute, message, base)
      end
    end
  end

  class Errors
    alias_method :original_full_message, :full_message

    # if the error message starts with "^", then don't prepend the attribute name
    def full_message(attribute, message)
      return message if attribute == :base

      if message =~ /\A\^/
        I18n.t(:"errors.format.full_message", {
          default: "%{message}",
          message:  message[1..-1]
        })
      else
        original_full_message(attribute, message)
      end
    end
  end
end

ActiveSupport.on_load(:i18n) do
  I18n.load_path << File.dirname(__FILE__) + '/locale/en.yml'
end
