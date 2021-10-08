class Image < ApplicationRecord
  belongs_to :imageable, :polymorphic => true, counter_cache: true
end
