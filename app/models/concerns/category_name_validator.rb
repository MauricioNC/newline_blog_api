class CategoryNameValidator < ActiveModel::Validator
  def validate(record)
    error_msg = "Please only add letters and numbers, special characters are unpermitted"
    regexp = /[A-Za-z0-9]/i

    # validation for category_name
    record.errors.add(:category, error_msg) unless record.category_name.match?(regexp)
  end
end
