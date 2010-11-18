require "pathname"

module Minjector
  class Reader
    class << self

      def read(path)
        names = []
        parent = Pathname.new(path)

        parent.children.each do |child|
          next unless child.directory?

          names << child.relative_path_from(parent).to_s
        end

        names
      end

    end
  end
end