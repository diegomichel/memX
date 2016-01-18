class User < ActiveRecord::Base
  has_many :lists
  validates_uniqueness_of :email, case_sensitive: false
end
