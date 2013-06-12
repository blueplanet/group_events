class Kpt < ActiveRecord::Base
  KEEP = 1
  PROBLEM = 2
  TRY = 3
  
  belongs_to :event

  validates :content, presence: {message: '内容を入力してください'}
end
