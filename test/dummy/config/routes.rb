Rails.application.routes.draw do
  mount QuickSearch::HistorySearcher::Engine => "/quick_search-history_searcher"
end
