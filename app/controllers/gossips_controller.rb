class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    @user = User.all
  end
   
  def new
    @gossips = Gossip.new
  end
   
  def create
   #u = User.find_by(first_name:"anonymos")
   
  @gossips = Gossip.new(title: params[:title], content: params[:content], user_id: rand(User.first.id..User.last.id))  # avec xxx qui sont les données obtenues à partir du formulaire
  

    if @gossips.save # essaie de sauvegarder en base @gossip
      # si ça marche, il redirige vers la page d'index du site
      redirect_to action: 'index' 
    else
      render 'new'
      # sinon, il render la view new (qui est celle sur laquelle on est déjà)
    end
  end

  def edit
  end

  def show
    @potin = Gossip.find(params[:id].to_i)
  end
end
