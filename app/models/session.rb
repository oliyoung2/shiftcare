# == Schema Information
#
# Table name: sessions
#
#  id         :bigint           not null, primary key
#  code       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_sessions_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Session < ApplicationRecord
  belongs_to :user

  scope :active, -> { where("updated_at < ?", 2.days.ago) }

  after_create :create_code

  def create_code
    update(code: SecureRandom.base64(12))
  end
end
