class ApplicationController < ActionController::Base
    def set_seller
        @user = User.find(current_user.id)
        @user.role = :seller
        if @user.save
            redirect_to products_path, notice: "Hi, nice to meet you !"
        end

    end

    def set_customer
        @user = User.find(current_user.id)
        @user.role = :customer
        if @user.save
            redirect_to products_path, notice: "Hopes everything goes well sir."
        end
    end
end
