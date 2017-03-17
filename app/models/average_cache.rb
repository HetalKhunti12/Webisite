class AverageCache < ActiveRecord::Base
  belongs_to :rater, :class_name => "Contact"
  belongs_to :rateable, :polymorphic => true
end
