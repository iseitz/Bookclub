# RSpec.describe Book, type: :model do
#   include CarrierWave::Test::Matchers
#
#   describe '#' do
#     before do
#       @movie = FactoryBot.create(:movie)
#       @movie.poster.store!(File.open('spec/fixtures/test_poster.jpg'))
#     end
#
#     describe '.small' do
#       it "scales down an image to be exactly 100 by 100 pixels" do
#         expect(@movie.poster.small).to have_dimensions(100, 100)
#       end
#     end
#
#     describe '.medium' do
#       it "scales down an image to be no wider than 200 pixels" do
#         expect(@movie.poster.medium).to be_no_wider_than(200)
#       end
#     end
#
#     describe '.large' do
#       it "scales down a landscape image to be no larger than 400 by 400 pixels" do
#         expect(@movie.poster.large).to be_no_larger_than(400, 400)
#       end
#     end
#   end
# end
