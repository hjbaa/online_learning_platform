class Teacher::BaseController <ApplicationController
  layout 'teacher'

  before_action :authenticate_user!
  before_action :teacher_required!

  private

  def teacher_required!
    return if current_user.is_a?(Teacher)

    flash[:danger] = 'You are not required to view this page!'
    redirect_to root_path
  end
end
