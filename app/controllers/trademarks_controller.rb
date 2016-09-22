class TrademarksController < ApplicationController
  before_action :admin_user

  def index
    @trademarks = Trademark.paginate(page: params[:page],:per_page => 10)
  end

  def show
    @trademark= Trademark.find_by name:(params[:name])
  end

  def new
    @trademark = Trademark.new
  end

  def create
    @trademark = Trademark.create(trademark_params)
  end

  def edit
    @trademark= Trademark.find_by name:(params[:name])
  end

  def update
    @trademark= Trademark.find_by name:(params[:name])
    @trademark.update_attributes(trademark_params)
  end

  def delete
    @trademark = Trademark.find_by name:(params[:trademark_name])
  end

  def destroy
    @trademark= Trademark.find_by name:(params[:name])
    @trademark.destroy
  end

  private
    def trademark_params
        params.require(:trademark).permit(:name)
    end
end
