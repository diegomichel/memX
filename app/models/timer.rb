class Timer < ActiveRecord::Base
  belongs_to :list
  belongs_to :test
end
