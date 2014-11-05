class PhonenumberValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    unless value =~ /\A[\d\ \-x\(\)]{7,}\z/
      record.errors[attribute] << (options[:message] || "wrong phone number")
    end
  end

end