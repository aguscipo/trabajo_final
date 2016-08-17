class TrademarksController < ApplicationController
  before_action :admin_user

  def index
    @trademarks = Trademark.paginate(page: params[:page])
  end

  def show
    @trademark= Trademark.find_by name:(params[:name])
  end

  def new
    @trademark = Trademark.new
  end

  def create
    @trademarks = Trademark.all
    @trademark = Trademark.create(trademark_params)
  end

  def edit
    @trademark= Trademark.find_by name:(params[:name])
  end

  def update
    @trademarks = Trademark.all
    @trademark= Trademark.find_by name:(params[:name])
    @trademark.update_attributes(trademark_params)
  end

  def delete
    @trademark = Trademark.find_by name:(params[:trademark_name])
  end

  def destroy
    @trademarks = Trademark.all
    @trademark= Trademark.find_by name:(params[:name])
    @trademark.destroy
  end

  private
    def trademark_params
        params.require(:trademark).permit(:name)
    end
end
