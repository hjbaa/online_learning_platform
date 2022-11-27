class Teacher::TeachersController < Teacher::BaseController
  def show
    # TODO: придумать че сюда запихнуть
    @teacher = current_user
  end
end
