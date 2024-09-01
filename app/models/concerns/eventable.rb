module Eventable
  extend ActiveSupport::Concern

  included do
    scope :timeline, ->(from_date = Date.today) { select("#{name.pluralize}.id, #{name.pluralize}.start_date, #{name.pluralize}.name, '#{name.downcase}' as type")
                                                 .where('?.start_date >= ?', name.pluralize, from_date) }
  end
end
