class Image

  def initialize (image)
    @image = image
  end

  def image
    @image
  end

  def output_image
      @image.each do |row|
        row.each do |i|
          print i
        end
      puts "\n" 
      end
  end


end

image = Image.new ([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image
