module PagesHelper
  def rc_to_html(content)
    return RedCloth.new(content).to_html
  end
end
