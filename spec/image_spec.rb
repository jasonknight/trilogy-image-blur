#spec/image_spec.rb
require "./image.rb"
RSpec.describe Image do
    describe "#initialize" do
        it "should setup the data" do
            i = Image.new([])
            expect(i.data).to eq([])
        end
    end
    describe "#get_image" do
        it "should return a string..." do
            i = Image.new([[0,0,0],[0,0,0]])
            expect(i.get_image).to eq("000\n000")
        end
        i = Image.new([[0,0,0],[0,0,0]])
        specify { 
            expect { 
                i.output_image 
            }.to output("000\n000\n").to_stdout 
        }
    end
    describe "#blur" do 
        it "should blur distance of 1" do
            i = Image.new([
                [0,0,0,0],
                [0,0,0,0],
                [0,0,0,0],
                [0,1,0,0],
                [0,0,0,0],
                [0,0,0,0],
            ])
            target = [
                [0,0,0,0],
                [0,0,0,0],
                [0,1,0,0],
                [1,1,1,0],
                [0,1,0,0],
                [0,0,0,0],
            ].collect{|r| r.join }.join("\n")
            expect(i.blur(1).get_image).to eq(target)
        end
        it "should blur distance of 1 on edge" do
            i = Image.new([
                [0,0,0,0],
                [0,0,0,0],
                [0,0,0,0],
                [0,1,0,0],
                [0,0,0,0],
                [0,0,0,1],
            ])
            target = [
                [0,0,0,0],
                [0,0,0,0],
                [0,1,0,0],
                [1,1,1,0],
                [0,1,0,1],
                [0,0,1,1],
            ].collect{|r| r.join }.join("\n")
            expect(i.blur(1).get_image).to eq(target)
        end
        it "should blur distance of 2" do
            i = Image.new([
                [0,0,0,0],
                [0,0,0,0],
                [0,0,0,0],
                [0,1,0,0],
                [0,0,0,0],
                [0,0,0,0],
            ])
            target = [
                [0,0,0,0],
                [0,1,0,0],
                [1,1,1,0],
                [1,1,1,1],
                [1,1,1,0],
                [0,1,0,0],
            ].collect{|r| r.join }.join("\n")
            expect(i.blur(2).get_image).to eq(target)
        end
        it "should blur distance of 3" do
            i = Image.new([
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,1,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,1],
            ])
            target = [
                [0,0,0,0,0,0,0,0,0],
                [0,0,0,1,0,0,0,0,0],
                [0,0,1,1,1,0,0,0,0],
                [0,1,1,1,1,1,0,0,0],
                [1,1,1,1,1,1,1,0,0],
                [0,1,1,1,1,1,0,0,0],
                [0,0,1,1,1,0,0,0,0],
                [0,0,0,1,0,0,0,0,0],
                [0,0,0,0,0,0,0,0,1],
                [0,0,0,0,0,0,0,1,1],
                [0,0,0,0,0,0,1,1,1],
                [0,0,0,0,0,1,1,1,1],
            ].collect{|r| r.join }.join("\n")
            expect(i.blur(3).get_image).to eq(target)
        end
    end
end
