require "multi_json"

module Rulers
  module Model
    class FileModel
      def initialize(filename)
        @filename = filename
        basename = File.split(filename)[-1]
        @id = File.basename(basename, '.json').to_i
        obj = File.read(filename)
        @hash = MultiJson.load(obj)
      end

      def self.all
        files = Dir["db/quotes/*.json"]
        files.map { |f| FileModel.new f }
      end

      def self.create(attrs)
        hash = {}
        hash["submitter"] = attrs["submitter"] || ""
        hash["quote"] = attrs["quote"] || ""
        hash["attribution"] = attrs["attribution"] || ""

        files = Dir["db/quotes/*.json"]
        names = files.map { |f| f.split("/")[-1] }
        highest = names.map { |b| b[0...-5].to_i }.max
        id = highest + 1

        File.open("db/quotes/#{id}.json", "w") do |f|
          f.write <<TEMPLATE
          {
            "submitter": "#{hash["submitter"]}",
            "quote": "#{hash["quote"]}",
            "attribution": "#{hash["attribution"]}"
          }
TEMPLATE
        end

        FileModel.new "db/quotes/#{id}.json"
      end

      def [](name)
        @hash[name.to_s]
      end

      def []=(name, value)
        @hash[name.to_s] = value
      end

      def self.find(id)
        begin
          FileModel.new("db/quotes/#{id}.json")
        rescue
          # TODO - add a RecordNotFound exception
          return nil
        end
      end

    end
  end
end
