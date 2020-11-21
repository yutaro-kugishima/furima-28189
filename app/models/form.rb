class Form < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :hoge:fuge...

  # ここにバリデーションの処理を書く
  with_options presence: true do
  validates :price
  end

  def save
    # 各テーブルにデータを保存する処理を書く

  end
end