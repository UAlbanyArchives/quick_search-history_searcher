module QuickSearch
  module History
    class Engine < ::Rails::Engine
      isolate_namespace QuickSearch::History
    end
  end
end
