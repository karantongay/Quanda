class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  has_many :relationships, :foreign_key => "follower_id",
                       :dependent => :destroy

  acts_as_follower
  acts_as_followable

end