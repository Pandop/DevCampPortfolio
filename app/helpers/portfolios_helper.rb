module PortfoliosHelper

  def generate_image(height:, width:) 
    return "http://via.placeholder.com/#{height}x#{width}"
  end

  def portfolio_img(img, type)
    #byebug
    if img.model.main_image? || img.model.thumb_image? 
      return img 
    elsif type=='thumb'
      generate_image(height:'356', width:'280')
    elsif type=='main'
      generate_image(height:'600', width:'400')
    end
  end

  def set_defaults
    self.main_image  ||= generate_image(600, 400)
    self.thumb_image ||= generate_image(356, 280)

    #self.main_image  ||= "http://via.placeholder.com/600x400"
    #self.thumb_image ||= "http://via.placeholder.com/350x200" 

   ## if self.main_image == nil 
      #self.main_image = "http://via.placeholder.com/600x400"
    #end
  ##  if
    # self.thumb_image ||= "http://via.placeholder.com/350x200"
    #end
  end
end
