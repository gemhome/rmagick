RSpec.describe Magick::Image, '#filename' do
  before do
    @img = described_class.new(100, 100)
    gc = Magick::Draw.new

    gc.stroke_width(5)
    gc.circle(50, 50, 80, 80)
    gc.draw(@img)

    @hat = described_class.read(FLOWER_HAT).first
    @p = described_class.read(IMAGE_WITH_PROFILE).first.color_profile
  end

  it 'works' do
    expect { @img.filename }.not_to raise_error
    expect(@img.filename).to eq('')
    expect { @img.filename = 'xxx' }.to raise_error(NoMethodError)
  end
end
