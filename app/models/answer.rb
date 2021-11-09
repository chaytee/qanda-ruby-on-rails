class Answer < ApplicationRecord
    #questionに紐づく
  belongs_to :question
  
    #バリデーション設定-空文字×
  validates :name, presence: true
  validates :content, presence: true
end
