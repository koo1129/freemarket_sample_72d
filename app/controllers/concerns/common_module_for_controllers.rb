#コントローラーの共通処理
module CommonModuleForControllers
  extend ActiveSupport::Concern

    def set_category
      @parents = Category.where(ancestry: nil).order("id ASC").limit(13)
    end
    
    def set_prefecture
      set_item
      @prefecture = Prefecture.find_by(id: @item.prefecture_id)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_item
      @item = Item.find(params[:id])
    end
    
    def user_show_info
      @items = Item.where(exhibitor_id: @user.id)
      @evaluations = Item.where.not(purchaser_id_status: nil)
    end
    
    def set_address
      @address = Adress.find(params[:id])
    end

end