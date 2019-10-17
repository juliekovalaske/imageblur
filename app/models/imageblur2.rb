class Image
  attr_accessor :image

  def initialize (image)
    @image = image
  end

  def blur
    row_count = @image.length 
    column_number = @image[0].length
    image2 = Marshal.load(Marshal.dump(@image))
    image2.each_with_index do |row, row_number|
      row.each_with_index do |cell, column|
        if cell == 1
          if row_number - 1 >= 0
            @image[row_number - 1][column] = 1
          end
          if row_number + 1 < row_count
            @image[row_number + 1][column] = 1
          end
          if column - 1 >= 0
            @image[row_number][column - 1] = 1
          end
          if column + 1 < column_number
            @image[row_number][column + 1] = 1
          end
        end
      end
    end
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
image.blur
image.output_image


