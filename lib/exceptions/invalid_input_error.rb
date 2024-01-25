class InvalidInputError < StandardError
   def initialize(msg = '※※※入力形式が不正です※※※')
      super
    end
end
