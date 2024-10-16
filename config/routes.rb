Rails.application.routes.draw do
  devise_for :users
  root to: "prototypes#index"
  
  resources :prototypes do
    resources :comments, only: [:create, :show] # 必要なアクションを追加
    resources :users, only: :show
  end

  # プロトタイプに対する他のアクションが必要な場合はここに追加
  # 例えば、次のようにすると良いでしょう。
  # resources :prototypes, only: [:new, :create, :show, :edit, :update, :destroy]
end
