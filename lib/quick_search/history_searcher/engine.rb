module QuickSearch
  module HistorySearcher
    class Engine < ::Rails::Engine
      isolate_namespace QuickSearch::HistorySearcher
    end
  end
end
