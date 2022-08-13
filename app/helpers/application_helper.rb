# frozen_string_literal: true

module ApplicationHelper
  def brand_logo_md(options = {})
    _brand_logo(height: '68px', width: '180px', options:)
  end

  def brand_logo_lg(options = {})
    _brand_logo(height: '97px', width: '280px', options:)
  end

  def _brand_logo(height:, width:, options: {})
    options = options.merge({ class: 'mx-auto d-block' }) if options[:centered]
    # image_tag('logo.svg', { height:, width: }.merge(options))
    image_url = 'https://upload.wikimedia.org/wikipedia/commons/6/62/Ruby_On_Rails_Logo.svg'
    image_tag(image_url, { height:, width: }.merge(options))
  end
end
