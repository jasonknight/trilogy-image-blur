class Image
    attr_accessor :data
    def initialize(d)
        @data = d
    end
    def get_image
        return @data.collect{|r| r.join }.join("\n")
    end
    def output_image
        puts get_image
    end
    def can?(nd,y,x)
        return (y >= 0 and y < nd.length and x >= 0 and x < nd[y].length)
    end
    def _inner_blur(nd,y,x,dist)
        nd[y][x] = 1
        (y-dist..y+dist).each do |cy|
            (x-dist..x+dist).each do |cx|
                dx = (x - cx).abs 
                dy = (y - cy).abs
                if dx + dy <= dist and can?(nd,cy,cx) then
                    nd[cy][cx] = 1
                end
            end
        end
        return nd
    end
    def blur(dist)
        nd = @data.collect{|r| r.collect { 0 } } 
        (@data.length).times do |y|
            (@data[y].length).times do |x|
                if @data[y][x] == 1 then
                    nd = _inner_blur(nd,y,x,dist)
                end
            end
        end
        @data = nd
        return self
    end
end
