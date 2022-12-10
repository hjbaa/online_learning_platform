class Teacher::TestsController < Teacher::BaseController
  def create
    @test = Test.create(test_params)
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to teacher_article_path(@test.testable)
  end

  private

  def test_params
    params.require(:test).permit(:title, :author_id, :testable_type, :testable_id,
                                 questions_attributes: [:title, { answers_attributes: %i[content correct description] }])
  end
end
