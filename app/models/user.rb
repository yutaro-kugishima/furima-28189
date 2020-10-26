class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence:true do
    validates :nickname
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' }
    validates :first_name_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角文字（カナ）を使用してください' }
    validates :last_name_kana, format: { with: /\A[ァ-ン]+\z/, message: '全角文字（カナ）を使用してください' }
    validates :birth_date
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '6文字以上にしてください' }
    validates :password_confrimation,format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: '6文字以上にしてください' }
  end
end