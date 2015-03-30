$LOAD_PATH << "players"

module Controller
  module PlayerDiscoverer
    class << self

      def players
        Dir["players/*"].map do |path|
          player = File.basename(path).gsub(".rb", "")

          require player
          Object.const_get(player.capitalize)
        end
      end

    end
  end
end
