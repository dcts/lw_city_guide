class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :spots
  has_many :ratings, dependent: :destroy

  has_and_belongs_to_many :cities

  validates :github_handle, presence: true

  def city_keeper?
    cities.any?
  end

  def city_keeper_for?(city)
    cities.include?(city)
  end
end

# You are asking this question to a particular user
# Are you a city keeper?
