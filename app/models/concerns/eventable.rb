module Eventable
  extend ActiveSupport::Concern

  included do
    scope :timeline, ->(from_date = Date.today) { where(start_date: from_date..) }
  end
end
