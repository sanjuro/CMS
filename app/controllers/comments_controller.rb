class CommentsController < ApplicationController
  
  def new
    commentable_type = params[:commentable][:commentable]
    commentable_id = params[:commentable][:commentable_id]
    # Get the object that you want to comment
    commentable = Comment.find_commentable(commentable_type, commentable_id)
  
    # Create a comment with the user submitted content
    comment = Comment.new(params[:comment])
    # Assign this comment to the logged in user
    comment.user_id = current_user.id
  
    # Add the comment
    commentable.comments << comment
  
    flash[:success] = I18n.t(:comment_added)
    
    redirect_to(commentable) 
  end 
  
  def destroy
    comment = Comment.find_by_id!(params[:id])  
      
    commentable = Comment.find_commentable(comment.commentable_type, comment.commentable_id)
    comment.destroy
   
    redirect_to(commentable) 
  end  
  
end
