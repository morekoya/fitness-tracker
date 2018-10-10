class StocksController > ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:dager] = "You have entered an empty search string"
    else 
      flash.now[:danger] = "You have entered an invlaid searh string"  unless @stock
    end
  @stock = Stock.new_form_lookup(params[:stock])
  respond_to do |format|
    format.js { render partial: 'users/result' }
  end
end