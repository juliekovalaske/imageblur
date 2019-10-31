class Image
  attr_accessor :image

  def initialize (image)
    @image = image
  end

  def blur(distance)
    image2 = Marshal.load(Marshal.dump(@image))
    image2.each_with_index do |row, row_number|
      row.each_with_index do |cell, column|
        if cell == 1 
          fill_in(row_number, column, distance)
        end
      end
    end
  end

  def fill_in(x, y, distance)
    @image.each_with_index do |row, row_number|
      row.each_with_index do |cell, column|
        point2 = [row_number, column]
        point1 = [x, y]
        if manhattan_distance(point1, point2) <= distance
          @image[row_number][column] = 1
        end
      end
    end
  end

  def manhattan_distance(a, b)
    (a[0] - b[0]).abs + (a[1] - b[1]).abs
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
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1]
])
image.blur(1)
image.output_image


