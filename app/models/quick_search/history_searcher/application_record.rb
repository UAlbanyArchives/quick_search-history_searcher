module QuickSearch
  module HistorySearcher
    class ApplicationRecord < ActiveRecord::Base
      self.abstract_class = true
    end
  end
end
