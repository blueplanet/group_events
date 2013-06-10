class Event < ActiveRecord::Base
  JOIN = 1
  ABSENCE = 2
  SUBTLE = 3

  belongs_to :group

  has_many :event_users

  has_many :participant_users, -> { where join_type: JOIN }, class_name: "EventUser" 
  has_many :participants, through: :participant_users, source: :user

  has_many :absentee_users, -> { where join_type: ABSENCE }, class_name: "EventUser"
  has_many :absentees, through: :absentee_users, source: :user

  has_many :subtle_users, -> { where join_type: SUBTLE }, class_name: "EventUser"
  has_many :subtles, through: :subtle_users, source: :user

  validates :date, presence: true
  validates :time, presence: {message: "時間を入力してください"}
end
