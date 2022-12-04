class Teacher::VisibilitiesController < Teacher::BaseController

  def create
    @visibility = Visibility.new(visibility_params)

    if @visibility.save
      redirect_to teacher_group_path(@visibility.group)
    else
      flash[:alert] = 'Not saved!'
      redirect_to teacher_groups_path
    end
  end

  def destroy
    @visibility = Visibility.find(params[:id])

    redirect_to teacher_group_path(@visibility.destroy.group)
  end

  private

  def visibility_params
    params.require(:visibility).permit(:group_id, :subject_id)
  end
end
