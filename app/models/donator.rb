class Donator < ActiveRecord::Base
  validates :name, presence: { message: "Name can't be blank." }
  validates :pledge, presence: { message: "Pledge can't be blank." }, numericality: { only_integer: true, message: "Pledge is integer only." }
  validates :email, allow_blank: true, email: true
  validates :phone,	allow_blank: true, phonenumber: true
  validate :check_consistency

  def check_consistency
    return !(email.blank? and phone.blank?)
  end

end
