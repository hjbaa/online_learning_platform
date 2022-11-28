class Teacher::SubjectsController < Teacher::BaseController
  before_action :find_subject, only: :show
  def index
    @subjects = Subject.all
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash[:success] = 'New subject created!'
      redirect_to teacher_subjects_path
    else
      render :new
    end
  end

  def new
    @subject = Subject.new
  end

  def show; end

  private

  def subject_params
    params.require(:subject).permit(:title)
  end

  def find_subject
    @subject = Subject.find(params[:id])
  end
end
