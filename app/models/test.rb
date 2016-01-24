class Test < ActiveRecord::Base
  belongs_to :list
  validates :list_id, presence: true

  def diff
    Diffy::SplitDiff.new(text,
                         list.text,
                         diff: ["-U 10000", "-w"],
                         format: :html,
                         include_plus_and_minus_in_html: true,
                         allow_empty_diff: false)
  end

  def score
    lines = list.text.lines.count
    unchanged = diff.left.count_word("unchanged")
    inserts = diff.left.count_word("ins")
    deletes = diff.left.count_word("del")
    100/lines*unchanged if lines && unchanged && lines > 0
  end
end
