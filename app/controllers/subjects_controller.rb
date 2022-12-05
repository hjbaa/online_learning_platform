class SubjectsController < ApplicationController
  before_action :authenticate_user!
  def index
    @subjects = case current_user
                when Admin
                  Subject.all
                when Teacher
                  Subject.where(author: current_user)
                else
                  current_user&.group&.visible_subjects || Subject.all
                end
  end

  def show
    @subject = Subject.find(params[:id])
  end
end
