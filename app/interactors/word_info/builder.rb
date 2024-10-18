module WordInfo
  class Builder < Base
    BUILDER_CLASSES = {
      "adj" => Adjective::Builder,
      "subst" => Noun::Builder,
      "inf" => Verb::Builder
    }.freeze

    def call
      super()
      corresponding_class.call(items:, processed_items:)
    end

    private

    def corresponding_class
      BUILDER_CLASSES[form_name]
    end
  end
end
