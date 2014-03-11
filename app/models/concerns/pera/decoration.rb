module PERA::Decoration
  extend ActiveSupport::Concern
  include Draper::Decoratable


  # Workaround to force a default decorator for all
  # resources
  def decorate
    begin
      super
    rescue Draper::UninferrableDecoratorError
      PERA::ResourceDecorator.decorate self
    end
  end
end
