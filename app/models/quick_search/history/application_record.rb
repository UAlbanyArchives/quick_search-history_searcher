module QuickSearch
  module History
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
