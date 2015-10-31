class Item < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :user_id, presence: true

  def days_left
    7 - (Time.now.utc.to_date - created_at.to_date).to_i
  end
end
