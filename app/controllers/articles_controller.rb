class ArticlesController < ApplicationController
	include ArticlesHelper
		def index
			@articles = Article.all
		end

		def show
			@article = Article.find(params[:id])
			@comment = Comment.new
			@comment.article_id = @article.id
		end

		def new
			@article = Article.new
		end

		def create
			@article = Article.new(article_params)
			@article.save
			redirect_to article_path(@article)
			@comment = Comment.new(comment_params)
			@comment.article_id = params[:article_id]
			@comment.save
			redirect_to article_path(@comment.article)
		end

		def comment_params
			params.require(:comment).permit(:author_name, :body)
		end

		def destroy
			@article = Article.destroy(params[:id])
			flash.notice = "Article '#{@article.title}' Deleted!"
			redirect_to articles_path(@article)
		end

		def edit
			@article = Article.find(params[:id])
		end

		def update
			@article = Article.find(params[:id])
			@article.update(article_params)
			flash.notice = "Article '#{@article.title}' Updated!"
			redirect_to article_path(@article)
		end
end
