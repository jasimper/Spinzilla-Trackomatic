class YarnsController < ApplicationController
  before_action :get_yarn, only: [:show, :edit, :update, :destroy]

  def index
    @yarns = current_user.yarns
    respond_to do |format|
      if current_user
        format.html
        format.json { render json: @yarns}
      else
        format.html { redirect_to '/login' }
        format.json { render json: @yarn.errors, status: 422 }
      end
    end
  end

  def new
    @yarn = Yarn.new
  end

  def create
    @yarn = current_user.yarns.new(yarn_params)
    respond_to do |format|
      if @yarn.save
        format.html { redirect_to yarns_path }
        format.json { render json: {}, status: 201 }
      else
        format.html { render :new }
        format.json { render json: @yarn.errors, status: 422 }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @yarn.update_attributes(yarn_params)
        format.html { redirect_to yarns_path }
        format.json { render json: {}, status: 201 }
      else
        format.html { render :edit }
        format.json { render json: @yarn.errors, status: 422 }
      end
    end
  end

  def destroy
    @yarn.destroy
    respond_to do |format|
      format.html { redirect_to yarns_path  }
      format.json { render json: {}, status: 200 }
    end
  end

  private

  def yarn_params
    params.require(:yarn).permit(:user_id, :name, :measured_yardage, :number_of_plies, :yardage_credit, user_attributes: [:total_yardage])
  end

  def get_yarn
    @yarn = current_user.yarns.find(params[:id])
  end

end
