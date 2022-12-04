class Teacher::SubjectsController < Teacher::BaseController
  before_action :find_subject, only: %i[show edit update destroy]
  def index
    @subjects = Subject.all
  end

  def create
    @subject = current_user.created_subjects.new(subject_params)

    if @subject.save
      flash[:success] = 'New subject created!'
      redirect_to teacher_subject_path(@subject)
    else
      render :new
    end
  end

  def edit; end

  def update
    return head(:forbidden) unless current_user.author_of?(@subject)

    @subject.update(subject_params)

    redirect_to teacher_subject_path(@subject)
  end

  def destroy
    return head(:forbidden) unless current_user.author_of?(@subject)

    @subject.destroy
    flash[:success] = 'Subject was destroyed!'
    redirect_to teacher_subjects_path
  end

  def new
    @subject = Subject.new
  end

  def show; end

  private

  def subject_params
    params.require(:subject).permit(:title, :description)
  end

  def find_subject
    @subject = Subject.find(params[:id])
  end
end
