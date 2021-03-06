class Api::LegislatorsController < ApplicationController
  respond_to :json
  def bills
    full_name = params[:legislator_id]
    names = get_first_and_last_name_from(full_name)
    legislator = Legislator.where(:last_name => names[:last_name])
    if names[:first_name]
      legislator = legislator.where(:first_name => names[:first_name])
    end
    respond_with CaliforniaLegislatureVoteTallier.getVotesFor(legislator.first)
  end

  def index
    respond_with Legislator.all
  end

  def show
  end

  def get_first_and_last_name_from full_name
    names = full_name.split(" ")
    if(names.length == 1)
      {:last_name => names[0]}
    else
      {:first_name => names[0], :last_name => names[1]}
    end
  end

end