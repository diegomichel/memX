# A list contains the items to memorize
class List < ActiveRecord::Base
  belongs_to :user
  has_many :listitems, dependent: :destroy
  has_many :tests, dependent: :destroy

  validates :user_id, presence: true

  def text
    items = listitems.pluck(:text)
    items.join("\r\n")
  end

  def text=(text)
    text.split("\r\n").each do |item|
      listitems.create!(text: item,
                        previous_item_id: last_item_id)
    end
  end

  def last_item_id
    listitems.last ? listitems.last.id : nil
  end
end
