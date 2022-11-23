class Teacher::TestsController < Teacher::BaseController
  def create
    @test = Test.create(test_params)
  end

  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    redirect_to teacher_article_path(@test.article)
  end

  private

  def test_params
    params.require(:test).permit(:title, :author_id, :article_id,
                                 questions_attributes: [:title, { answers_attributes: %i[content correct description] }])
  end
end
