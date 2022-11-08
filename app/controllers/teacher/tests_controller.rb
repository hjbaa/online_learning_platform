class Teacher::TestsController < Teacher::BaseController
  def create
    @test = Test.new(test_params)

    flash[:success] = 'Your test was created!' if @test.save

    redirect_to teacher_article_path(@test.article)
  end

  private

  def test_params
    params.require(:test).permit(:title, :author_id, :article_id,
                                 questions_attributes: [:title, { answers_attributes: %i[content correct] }])
  end
end
