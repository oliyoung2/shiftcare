# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email_address   :string
#  firstname       :string
#  password_digest :string
#  surname         :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password

  has_many :bookings, foreign_key: "created_by_id"
  has_many :clients, through: :bookings
  has_many :sessions
end
