class Company < ApplicationRecord
  has_many :employees, class_name: "Employee"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
