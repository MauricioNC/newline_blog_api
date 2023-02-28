class PostTitleAndDescriptionValidator < ActiveModel::Validator
  def validate(record)
    error_msg = "Only add letters and numbers, special characters permitted are (!,@,#,$,%,^,&,*,(,),_,+,.)"
    regexp = /[A-Za-z0-9!@#$%^&*()_+:;,]+\@*/i

    # validation for title
    record.errors.add(:title, error_msg) unless record.title.match?(regexp)

    # validation for description
    record.errors.add(:description, error_msg) unless record.description.match?(regexp)
  end
end
