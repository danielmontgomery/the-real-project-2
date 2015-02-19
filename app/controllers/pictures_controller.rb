class PicturesController < ApplicationController
  def index
    @picture = Picture.all
    prng = Random.new
    @rand_pic = @picture[prng.rand(Picture.count)]
    @rand_pic2 = @picture[prng.rand(Picture.count)]
    # a better way to do rand pic:

    puts "=================="
    puts Picture.count
    puts "=================="
  end

  def show
  end

  def new
    @picture = Picture.new
  end

  def create
    picture = Picture.new(params.require(:picture).permit(:pic, :caption, :score))
    if picture.save
      redirect_to pictures_path
    end
  end

  def edit
      
  end

  def update
    if 
    Picure.update(params.require(:picture).permit(:pic, :caption, :score))
        # picture = Picture.find(params[:id])
        # (params.require(:picture).permit(:pic, :caption, :score))
    end
    if picture.save
      redirect_to pictures_path
    end
  end

  def destroy
  end
end

# THIS WORKS:
# @rand_pic.increment(:score)
