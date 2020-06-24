class PdfsController < ApplicationController
  def new
    @pdf = Pdf.new
    binding.pry
  end

  def create
    @pdf = Pdf.new(pdf_params)

    binding.pry
  end


  def pdf_params
    params.require(:pdf).permit(:attachment)
  end

end
