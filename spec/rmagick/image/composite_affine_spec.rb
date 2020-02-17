RSpec.describe Magick::Image, '#composite_affine' do
  it 'works' do
    affine = Magick::AffineMatrix.new(1, 0, 1, 0, 0, 0)
    image1 = described_class.read(IMAGES_DIR + '/Button_0.gif').first
    image2 = described_class.read(IMAGES_DIR + '/Button_1.gif').first
    image1.define('compose:args', '1x1')
    image2.define('compose:args', '1x1')

    result = image1.composite_affine(image2, affine)
    expect(result).to be_instance_of(described_class)
    expect(result).not_to be(image1)
  end
end
