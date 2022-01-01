Rails.application.routes.draw do
  root to: "home#index"
  get "oxford_words/search/:char", to: "oxford_words#index", as: "oxford_words"
  post "oxford_words/api/remember", to: "oxford_words#remember"
  put "oxford_words/api/cancle_remember", to: "oxford_words#cancle_remember"
  post "oxford_words/api/marked", to: "oxford_words#marked"
  put "oxford_words/api/cancle_marked", to: "oxford_words#cancle_marked"
  devise_for :users
end
