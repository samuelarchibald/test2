class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable   
  has_many :apps, dependent: :destroy
  has_many :nominations, dependent: :destroy
  validates :company_name, :presence => true
end
