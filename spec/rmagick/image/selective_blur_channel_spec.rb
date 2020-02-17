RSpec.describe Magick::Image, '#selective_blur_channel' do
  it 'works' do
    image = described_class.new(20, 20)

    res = image.selective_blur_channel(0, 1, '10%')
    expect(res).to be_instance_of(described_class)
    expect(res).not_to be(image)
    expect([res.columns, res.rows]).to eq([image.columns, image.rows])

    expect { image.selective_blur_channel(0, 1, 0.1) }.not_to raise_error
    expect { image.selective_blur_channel(0, 1, '10%', Magick::RedChannel) }.not_to raise_error
    expect { image.selective_blur_channel(0, 1, '10%', Magick::RedChannel, Magick::BlueChannel) }.not_to raise_error
    expect { image.selective_blur_channel(0, 1, '10%', Magick::RedChannel, Magick::BlueChannel, Magick::GreenChannel) }.not_to raise_error

    expect { image.selective_blur_channel(0, 1) }.to raise_error(ArgumentError)
    expect { image.selective_blur_channel(0, 1, 0.1, '10%') }.to raise_error(TypeError)
  end
end
