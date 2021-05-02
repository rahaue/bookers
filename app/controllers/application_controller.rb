class ApplicationController < ActionController::Base
    # 初期設定では用意されていないカラムをUserに追加しているので
    # 以下を追記する
    before_action :authenticate_user!, except: [:show, :top]
    # deviseの利用機能が使われるときに configure_permitterd_paramatersが使われる
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resourse)
       # ユーザー詳細画面
       # https://qiita.com/akkyta/items/b95ecde45d1c53598e88
       user_path(resourse)
    end
    
    protected
    # nameデータの操作を許可するアクションメソッドが指定されている
    # sign_upをする際に、ユーザ名(name)が許可されるということ
    def configure_permitted_parameters
        # 許可するものは、nameとemailです。これにしないと登録できなかった
        # nameでログインするには Initializerのdevise.rbをconfig.authentication_keys = [:name]に変更する
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :profile_image_id, :email])
    end
end
