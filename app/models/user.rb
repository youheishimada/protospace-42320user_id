class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # バリデーションの追加
  validates :name, presence: true
  validates :profile, presence: true
  validates :occupation, presence: true
  validates :position, presence: true

  # 関連付け（投稿との関係）
  has_many :prototypes, dependent: :destroy
end
