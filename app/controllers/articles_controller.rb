# frozen_string_literal: true

class ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_article, only: :show
  def index
    @articles = Article.all
  end

  def show; end

  private

  def find_article
    @article = Article.find(params[:id])
  end
end
