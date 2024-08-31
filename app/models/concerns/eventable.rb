module Eventable
  extend ActiveSupport::Concern

  included do
    scope :timeline, ->(from_date = Date.today) { select("id, start_date, name, '#{name.downcase}' as type")
                                                 .where('start_date >= ?', from_date) }
  end
end
