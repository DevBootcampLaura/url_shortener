get '/' do
  # let user create new short URL, display a list of shortened URLs

  erb :index
end

post '/urls' do
  input = params[:long_url]
  @data = Url.create(long_url: input)
  erb :show_url
end

# e.g., /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  params[:short_url]
  @data = Url.find_by(short_url: params[:short_url])
  # @data.click_count += 1
  # @data.save
  # increment counter for that URL
  redirect to("#{@data.long_url}")
end
