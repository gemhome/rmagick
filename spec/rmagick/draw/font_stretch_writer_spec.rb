RSpec.describe Magick::Draw, '#font_stretch=' do
  before do
    @draw = described_class.new
  end

  it 'works' do
    Magick::StretchType.values do |stretch|
      expect { @draw.font_stretch = stretch }.not_to raise_error
    end

    expect { @draw.font_stretch = 2 }.to raise_error(TypeError)
  end
end
