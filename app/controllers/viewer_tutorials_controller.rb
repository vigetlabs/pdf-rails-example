class ViewerTutorialsController < ApplicationController
  def show
  end

  def new
    @pdf = ViewerTutorial.new
  end

  def create
    @pdf = ViewerTutorial.new(pdf_params)

    if pdf.save
      redirect_to @pdf, notice: 'Successfully added a PDF.'
    else
      render 'new'
    end

  end

  def pdf
    @pdf ||= ViewerTutorial.find(params[:id])
  end
  helper_method :pdf

  def pdf_params
    params.require(:viewer_tutorial).permit(:attachment)
  end


end
