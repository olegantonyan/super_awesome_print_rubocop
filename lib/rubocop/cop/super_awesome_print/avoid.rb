module RuboCop
  module Cop
    module SuperAwesomePrint
      class Avoid < Base
        MSG = 'Avoid `%<method>s` in production.'.freeze
        RESTRICT_ON_SEND = %i[sap sapf].freeze

        def_node_matcher :sap_call?, <<-PATTERN
          (send {nil? self} {:sap :sapf} ...)
        PATTERN

        def on_send(node)
          return unless sap_call?(node)

          add_offense(node, message: format(MSG, method: node.method_name))
        end
      end
    end
  end
end
