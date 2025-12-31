module Redmine
  module FieldFormat
    class Project < List
      add 'project'

      def possible_values(custom_field, object = nil)
        user = User.current rescue nil

        scope = ::Project.active
        scope = scope.visible(user) if user
        projects = scope.order(:lft)

        # numeración jerárquica
        counters = Hash.new(0)

        projects.map do |project|
          level = project.ancestors.size

          # resetear niveles más profundos
          counters.keys.select { |k| k > level }.each { |k| counters.delete(k) }

          counters[level] += 1

          hierarchy = (0..level).map { |i| counters[i] }.join('.')

          label = "#{hierarchy}. #{project.name}"

          [label, project.id.to_s]
        end
      end

      # clave en Redmine 6.x: evitar filtros internos
      def possible_values_options(custom_field, object = nil, _options = nil)
        possible_values(custom_field, object)
      end

      def multiple_supported?
        true
      end

      def value_class
        Integer
      end

      def cast_value(custom_field, value)
        Array(value).reject(&:blank?).map(&:to_i)
      end

      def formatted_value(view, custom_field, value, customized = nil, html = false)
        ::Project.where(id: Array(value)).map(&:name).join(', ')
      end
    end
  end
end
