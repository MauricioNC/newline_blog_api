class TagNameValidator < ActiveModel::Validator
  def validate(record)
    error_msg = "Only add letters and numbers, special characters are unpermitted"
    regexp = /[A-Za-z0-9]/i

    # validation for tag_name
    record.errors.add(:tag_name, error_msg) unless record.tag_name.match?(regexp)
  end
end
