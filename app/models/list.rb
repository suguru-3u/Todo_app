class List < ApplicationRecord
  #userモデルと関連付け
  belongs_to :user
  validates :title,presence:true
  validates :body,presence:true
end
