class ViewerTutorialsController < ApplicationController
  def show
  end

  def new
    @pdf = ViewerTutorial.new
  end

  def create
    @pdf = ViewerTutorial.new(pdf_params)
    @pdf.text_content = pdf_text_scraper(@pdf) if @pdf.valid?

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

  def pdf_text_scraper(pdf)
    if pdf.attachment
      reader = PDF::Reader.new(pdf.attachment.path)
      reader.pages.map{ |page| page.text }.join
    end
  end


end
