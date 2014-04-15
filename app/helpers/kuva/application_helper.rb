module Kuva
  module ApplicationHelper

    def breadcrumbs_for(photoset)
      content = capture do
        if current_page? kuva.sets_url
          concat content_tag(:li, link_to_root_url)
        else
          concat content_tag(:li, link_to_root_url)
          concat content_tag(:li, link_to_set_url(photoset))
        end
      end

      content_tag :ul, content, class: "breadcrumbs"
    end

    private

    def link_to_root_url
      link_to t("kuva.photosets.title"), kuva.root_url
    end

    def link_to_set_url(photoset)
      link_to photoset.title, kuva.set_url(id: photoset.id)
    end
  end
end
