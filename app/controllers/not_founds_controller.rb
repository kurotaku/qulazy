class NotFoundsController < ApplicationController
  def index
    @not_founds = NotFound.all.order('point DESC')
  end
end
