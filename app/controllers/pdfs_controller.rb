class PdfsController < ApplicationController

  def show

  end

  def new
    @pdf = Pdf.new
  end

  def create
    @pdf = Pdf.new(pdf_params)

    if pdf.save
      redirect_to @pdf, notice: 'Successfully added a PDF.'
    else
      render 'new'
    end

  end

  def pdf
    binding.pry
    @pdf ||= Pdf.find(params[:id])
  end
  helper_method :pdf

  def pdf_params
    params.require(:pdf).permit(:attachment)
  end

end
