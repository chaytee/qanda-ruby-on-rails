class Question < ApplicationRecord
  #複数のanswerがあるけど、親が削除されたら全て削除される
  has_many :answers, dependent: :destroy
  
  
  #バリデーション設定-空文字×
  validates :name, presence: true
  validates :title, presence: true
  validates :content, presence: true
end
