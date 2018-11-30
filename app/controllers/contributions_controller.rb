class ContributionsController < ApplicationController
  before_action :set_contribution, only: [:edit, :update, :destroy]

  def index
    @contributions = Contribution.all
  end

  def new
    if params[:back]
      @contribution = Contribution.new(contribution_params)
    else
      @contribution = Contribution.new
    end
  end

  def create
    @contribution = Contribution.new(contribution_params)
    if @contribution.save
      redirect_to contributions_path, notice:"ツイートを投稿しました"
    else
      render'new'
    end
  end

  def show
  end

  def update
    if @contribution.update(contribution_params)
      redirect_to contributions_path,notice: "ツイートを編集しました"
    else
      render'edit'
    end
  end

  def destroy
    @contribution.destroy
    redirect_to contributions_path,notice:"ツイートを削除しました"
  end

  def confirm
    @contribution = Contribution.new(contribution_params)
    render :new if @contribution.invalid?
  end

  private
  def contribution_params
    params.require(:contribution).permit(:content)
  end

  def set_contribution
    @contribution = Contribution.find(params[:id])
  end

end
