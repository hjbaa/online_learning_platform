class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: :test_passing

  def test_passing
    @test_json = @test.to_json(only: :title,
                               include: { questions: { only: :title,
                                                       include: { answers: { only: %i[content correct description] } } } })
    @test_json.gsub!('\"', '\'').gsub!("'", '\'')

    puts "\n\n\n#{@test_json}\n\n\n"
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
