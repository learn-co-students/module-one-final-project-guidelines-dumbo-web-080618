class Stock < ActiveRecord::Base
  belongs_to :sneaker
  belongs_to :store
end
