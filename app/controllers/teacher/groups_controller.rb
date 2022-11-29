class Teacher::GroupsController < Teacher::BaseController
  before_action :find_group, only: %i[destroy show]

  def index
    @groups = current_user.controlled_groups
    @group = Group.new
  end

  def create
    @group = current_user.created_groups.create(group_params)
    current_user.controlled_groups << @group
  end

  def edit; end

  def update; end

  def show; end

  def destroy
    return head(:forbidden) unless @group.major_teacher == current_user

    @group.destroy
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def find_group
    @group = Group.find(params[:id])
  end
end
