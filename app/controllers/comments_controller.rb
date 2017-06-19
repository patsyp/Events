class CommentsController < ApplicationController
	def create
		comment = Comment.create(comment_params.merge(user:current_user, event:Event.find(params[:id])))
		if comment.valid?
			redirect_to "/events/#{params[:id]}"
		else
			flash[:comment_errors] = comment.errors.full_messages
			redirect_to "/events/#{params[:id]}"
		end
	end
	private
	def comment_params
		params.require(:comment).permit(:content)
	end
end
