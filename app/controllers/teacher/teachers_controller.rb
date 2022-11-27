class Teacher::TeachersController < Teacher::BaseController
  def show
    @teacher = current_user
  end
end
