class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'is invalid. Include both letters and numbers' }
         validates :password, format: { with: /\A[ -~｡-ﾟ]*\z/, message: 'must not include full-width characters.' }
         validates :nickname, presence: true
         with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
          validates :family_name_kanji
          validates :first_name_kanji
         end
         VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
         validates :family_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "はカタカナで入力して下さい。" }
         validates :first_name_kana, presence: true, format: { with: VALID_KATAKANA_REGEX, message: "はカタカナで入力して下さい。" }
        
         
         validates :birthday, presence: true
         
         has_many :items
         #has_many :records
         
end
