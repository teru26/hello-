class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  acts_as_reader

  mount_uploader :icon, IconUploader

  has_many :friends, through: :connect_users, source: "to_user"
  has_many :connect_users, foreign_key: "from_user_id"
  has_many :messeages
  has_many :chats, foreign_key: 'user1_id'
  # validates :username, presence: true, uniqueness: true, on: :update

  devise :confirmable, :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable

  def password_required?
    super if confirmed?
  end
end
