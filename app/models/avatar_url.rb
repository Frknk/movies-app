class AvatarUrl
  attr_reader :avatarable, :size

  def initialize(avatarable, size: 32)
    @avatarable = avatarable
    @size = size
  end

  def image_url
    name = ERB::Util.url_encode(avatarable.email)
    background = "#6366f1"
    text = "#fff"
    "https://eu.ui-avatars.com/api/#{name}/#{size * 2}/#{background.delete_prefix("#")}/#{text.delete_prefix("#")}"
  end
end
