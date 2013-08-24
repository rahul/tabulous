module Tabulous
  class Config
    class << self

      attr_reader :renderer,
                  :navbar_selector,
                  :active_tab_clickable,
                  :when_action_has_no_tab,
                  :render_subtabs_when_empty,
                  :use_css_scaffolding,
                  :background_color,
                  :text_color,
                  :active_tab_color,
                  :hover_tab_color,
                  :inactive_tab_color,
                  :inactive_text_color

      attr_writer :active_tab_clickable,
                  :navbar_selector,
                  :render_subtabs_when_empty,
                  :use_css_scaffolding,
                  :background_color,
                  :text_color,
                  :active_tab_color,
                  :hover_tab_color,
                  :inactive_tab_color,
                  :inactive_text_color

      def set_defaults
        @renderer = :default
        @active_tab_clickable = true
        @when_action_has_no_tab = :do_not_render
        @render_subtabs_when_empty = false
        @use_css_scaffolding = false
        @background_color = '#ccc'
        @text_color = '#444'
        @active_tab_color = '#fff'
        @hover_tab_color = '#ddd'
        @inactive_tab_color = '#aaa'
        @inactive_text_color = '#888'
      end

      def renderer=(val)
        unless val.is_a?(String) || val.is_a?(Symbol)
          raise ImproperValueError, "renderer must be a string or a symbol"
        end
        @renderer = val
      end

      def when_action_has_no_tab=(val)
        unless [:do_not_render, :render, :raise_error].include?(val)
          raise ImproperValueError, "when_action_has_no_tab must be either :render, :do_not_render, or :raise_error"
        end
        @when_action_has_no_tab = val
      end

      def navbar_selector=(val)
        raise ImproperValueError, "selector must be a string" unless val.is_a?(String)
        @navbar_selector = val
      end
    end
  end
end

Tabulous::Config.set_defaults
