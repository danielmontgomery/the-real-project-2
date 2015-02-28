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
      else
        redirect_to pictures_path
      end

    else
      redirect_to new_picture_path 
    end
    # a better way to do rand pic:

    puts "=================="
    puts Picture.count
    puts @rand_pic
    puts @rand_pic2
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
    pict = Picture.where(id: params[:id]).first
    # raise params.inspect
    pict.increment(:score)
    if pict.save
      redirect_to pictures_path
    else
      raise params.inspect
    end
    # if 
    # pict = Picure.update(params.require(:pic).permit(:pic, :caption, :score))
    #     picture = Picture.find(params[:id])
    #     (params.require(:picture).permit(:pic, :caption, :score))
    # end
    # if picture.save
    #   redirect_to pictures_path
    # end
  end

  def destroy
  end

  def destroy_multiple
      @toBeDeleted = Picture.where("created_at <= ?", Time.now - 24.hours)
      if @toBeDeleted.destroy_all
        redirect_to leaderboards_path
      else
        raise params.inspect
      end
  end


  # private
  #   def user_params
  #     params.require(:picture).permit(:pic, :caption, :score)
  #   end
end

# THIS WORKS:
