require 'rubocop'

module RuboCop
  module Cop
    module SuperAwesomePrint
      class Avoid < Cop # rubocop:disable Style/Documentation
        MSG = 'Avoid `sap` and `sapf` in production'.freeze

        def_node_matcher :sap?, <<-END
          (send nil
            {:sap :sapf}
            ...)
        END

        def on_send(node)
          return unless sap?(node)
          add_offense(node, :expression, format(MSG, node.source))
        end
      end
    end
  end
end
