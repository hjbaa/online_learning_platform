class Teacher::SubjectsController < Teacher::BaseController
  def index
    @subjects = Subject.all
  end

  def create; end

  def new; end

  def edit; end

  def destroy; end

  def update; end

  def show; end
end
