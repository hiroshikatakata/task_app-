class SignsController < ApplicationController


  def show
    @sign = current_sign
  end

  def account
    @sign = current_sign
  end

  def update
    @sign = Sign.find(params[:id])

    if @sign.update(params.require(:sign).permit(:name, :introduction, :icon))
      flash[:notice] = "プロフィールを更新しました"
      redirect_to action: :show
    else
      respond_to do |format|
      format.html { render :show, status: :unprocessable_entity }
      format.json { render json: @sign.errors, status: :unprocessable_entity }
      end
    end
  end

end
