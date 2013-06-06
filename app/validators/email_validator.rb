class EmailValidator < ActiveModel::EachValidator
  CRAZY_EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def validate_each(record, attribute_name, value)
    unless value =~ CRAZY_EMAIL_REGEX
      record.errors[attribute_name] << (options[:message] || "is not an email")
    end
  end
end