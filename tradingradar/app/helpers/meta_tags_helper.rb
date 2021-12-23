module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : I18n.t("application.name") + " | " + I18n.t("application.mission")
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : I18n.t("application.appDescription")
  end

  def meta_author
    content_for?(:meta_author) ? content_for(:meta_author) : I18n.t("application.author") + " | " + I18n.t("application.adminEmail")
  end

  def meta_robots
    content_for?(:meta_robots) ? content_for(:meta_robots) : "index, follow"
  end

  def meta_msvalidate
    content_for?(:meta_msvalidate) ? content_for(:meta_msvalidate) : "45EB28F9F855ED4A3A9904BC410CD169"
  end

  def meta_google_site_verification
    content_for?(:meta_google_site_verification) ? content_for(:meta_google_site_verification) : "hl74Eak8YodPVXxEm6CpfxpYUWsdNTIiW4FGPEUIKE8"
  end

  def canonical_link
    content_for?(:canonical_link) ? content_for(:canonical_link) : nil
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # ajoutez la ligne ci-dessous pour que le helper fonctionne indifféremment
    # avec une image dans vos assets ou une url absolue
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
