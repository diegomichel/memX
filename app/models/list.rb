class List < ActiveRecord::Base
  belongs_to :user
  has_many :listitems
  has_many :tests
  def text
    items = listitems.pluck(:text)
    items.join("\r\n")
  end

  def text=(val)
    val.split("\r\n").each do |item|
      listitems.create!({text: item, previous_item_id: listitems.last ?  listitems.last.id : nil })
    end
  end
end
