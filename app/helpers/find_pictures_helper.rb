module FindPicturesHelper
  def find_first_pic(pictures)
    # binding.pry
    y = (pictures.empty?) ? -1 : pictures
    if (y != -1)
      pictures[0] 
    else
       -1
    end
  end
  def find_other_pictures(pictures)
    arr = []
    if (pictures[1].nil?)
      -1
    else
      if (pictures.length >= 5)
        1.upto(4) do |i|
          arr << pictures[i]
        end
      else
        1.upto(pictures.length-1) do |i|
          arr << pictures[i]
        end
      end
      arr
    end
  end
end