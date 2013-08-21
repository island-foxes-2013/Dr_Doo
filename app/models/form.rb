class Form < ActiveRecord::Base
	attr_accessible :user_id, :title
	belongs_to :user
	has_many :fields, dependent: :destroy
	has_many :answers, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, :user_id, presence: true
end
