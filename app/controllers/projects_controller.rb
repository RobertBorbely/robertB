class ProjectsController < ApplicationController
  before_action :find_by_id, only: [:show, :edit,:update, :destroy]

  def index
    @projects = Project.all.order("created_at desc").paginate(page: params[:page], per_page: 2)
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new project_params

    if @project.save
      redirect_to @project, notice: "Gratulálok a projekted sikeresen elmentettük!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update
      redirect_to @project, notice: 'Sikeresen módosítottad a projekted! :)'
    else
      render 'edit'
    end
  end

  def destroy
    @project.destroy
  end

  private

  def find_by_id
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description, :link)
  end

end
