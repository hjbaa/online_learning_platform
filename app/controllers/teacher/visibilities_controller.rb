class Teacher::VisibilitiesController < Teacher::BaseController

  def create
    @visibility = Visibility.new(visibility_params)

    flash[:danger] = "hueta" unless @visibility.save

    redirect_to @visibility.group
  end

  def destroy

  end

  private

  def visibility_params
    params.require(:visibility).permit(:group_id, :subject_id)
  end
end
