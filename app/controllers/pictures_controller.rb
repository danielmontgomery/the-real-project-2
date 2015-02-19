class PicturesController < ApplicationController
  def index
    if Picture.count >= 2
      @picture = Picture.all
      prng = Random.new
      a = @picture[prng.rand(Picture.count)]
      b = @picture[prng.rand(Picture.count)]
      if a != b
        @rand_pic = a
        @rand_pic2 = b
      end
    else
      redirect_to new_picture_path
    end
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
    if current_user != nil
      picture = Picture.new(params.require(:picture).permit(:pic, :caption, :score))
      if picture.save
        redirect_to pictures_path
      else
        # TODO - This should redirect to an error page if the image isn't saved. The reason it won't save is because it is over 1MB. 
        redirect_to pictures_path
      end
    else
      redirect_to new_sessions_path
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
