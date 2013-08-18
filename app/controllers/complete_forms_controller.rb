class CompleteFormsController < ApplicationController
  def new
  end

  def create
  end

  def show
   my_form = current_user.forms.find(form.id)
  end
  
  def edit
  end

  def put
  end

  def destroy
  end
end
