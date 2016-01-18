class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_items
  has_many :tests
  def text
  end

  def text=(val)
  end
end
