class EnforceImgHTTPS < ::HTMLProofer::Check
  def run
    @html.css('img').each do |node|
      @img = create_element(node)
      line = node.line

      if nonsecure?
        return add_issue("Don't include images from an insecure location!", line: line)
      end
    end
  end

  private

  def nonsecure?
    @img.remote? && @img.scheme != 'https'
  end
end
