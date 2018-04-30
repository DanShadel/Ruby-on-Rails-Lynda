class SubjectsController < ApplicationController
 
  layout 'admin'
  
  def index
    @subjects = Subject.sorted
   
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(:name => 'default')
    @subject_count = Subject.count + 1
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject created Successfully"
      redirect_to(subjects_path)
    else
      @subject_count = Subject.count
      render('new')
    end
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject updated Successfully"
      redirect_to(subject_path(@subject))
    else
      @subject_count = Subject.count
      render('edit')
    end
    
  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed Successfully"
    redirect_to(subjects_path)
  end

  private 
    def subject_params
      params.require(:subject).permit(:name, :position, :visible)
    end
end