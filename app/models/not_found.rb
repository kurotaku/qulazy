class NotFound < ApplicationRecord
  after_initialize :set_default_point
  
  def set_default_point
    self.point ||= 0
  end
end
