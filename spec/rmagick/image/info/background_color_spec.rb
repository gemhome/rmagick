RSpec.describe Magick::Image::Info, '#background_color' do
  it 'works' do
    info = described_class.new

    expect { info.background_color = 'red' }.not_to raise_error
    red = Magick::Pixel.new(Magick::QuantumRange)
    expect { info.background_color = red }.not_to raise_error
    expect(info.background_color).to eq('red')
    image = Magick::Image.new(20, 20) { |inner_info| inner_info.background_color = 'red' }
    expect(image.background_color).to eq('red')
  end
end
