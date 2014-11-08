class Donor < ActiveRecord::Base
  validates :name, presence: true
  validates :pledge, presence: true, numericality: { only_integer: true }
  validates :email, email: true,       unless: :phone?
  validates :phone, phonenumber: true, unless: :email?

  def self.newest_first
    order(created_at: :desc)
  end
end
