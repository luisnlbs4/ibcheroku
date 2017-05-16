class WelcomeController < ApplicationController
  def index
        @publications = Publication.all.order('updated_at DESC')
  end
end
