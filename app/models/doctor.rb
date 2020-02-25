class Doctor < ApplicationRecord
  has_many :patients, :through => :appointments
  has_many :appointments, dependent: :destroy

  def full_name 
    "#{self.first_name} #{self.last_name}"
  end

  def title
    "Dr. #{self.last_name}"
  end
end
