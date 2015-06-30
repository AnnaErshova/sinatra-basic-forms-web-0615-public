class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  # show all songs
  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  # show individual page; route for showpage
  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end
  
  get '/songs/:id/edit' do 
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  # updates the song
  patch '/songs/:id' do |id|
    # @song = Song.find(params[:id])
    Song.update(id, params['song'])
    redirect "/songs/#{id}"
  end

end # end class