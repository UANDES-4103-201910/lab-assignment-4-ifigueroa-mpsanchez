class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
  has_many :orders
  validates :email, presence: true, email: true
  validates :password, presence: true, format: {with: /\A^([a-zA-Z0-9]{8,12})\z/i, message: "password must be only alphanumeric and between 8 and 12 characters"}
  validates :phone_number, presence: true, length: {in: 9..12}
end
