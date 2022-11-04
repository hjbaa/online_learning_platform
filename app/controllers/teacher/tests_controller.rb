class Teacher::TestsController < Teacher::BaseController
  def create
    @test = Test.new(test_params)
    render plain: @test.attributes
  end

  private

  def test_params
    params.require(:test).permit(:title, :author_id, :article_id)
  end
end
