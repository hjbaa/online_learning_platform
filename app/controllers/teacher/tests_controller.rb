class Teacher::TestsController < Teacher::BaseController
  def create
    @test = Test.new(test_params)

    if @test.save
      flash[:success] = 'Your test was created!'
      redirect_to @test.article
    else
      render @test.article
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :author_id, :article_id, questions_attributes: :title,
                                                                  answers_attributes: %i[content correct])
  end
end
