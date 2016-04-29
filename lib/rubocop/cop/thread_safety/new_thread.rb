# encoding: utf-8
# frozen_string_literal: true

module RuboCop
  module Cop
    module ThreadSafety
      class NewThread < Cop
        MSG = 'Avoid starting new threads.'.freeze

        def_node_matcher :new_thread?, <<-END
          (send (const nil :Thread) :new)
        END

        def on_send(node)
          return unless new_thread?(node)
          add_offense(node, :expression, format(MSG, node.source))
        end
      end
    end
  end
end
