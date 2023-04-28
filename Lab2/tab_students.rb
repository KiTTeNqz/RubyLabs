# frozen_string_literal: true

# frozen_string_literal: true
require 'glimmer-dsl-libui'
require_relative 'event_manager'
require_relative  'event_update_student_table'
require_relative 'student_list_controller'

class TabStudents
  include Glimmer
  STUDENTS_PER_PAGE = 20

  def initialize
    @controller = StudentListController.new(self)
    @current_page = 1
    @total_count = 0
  end

  def on_create
    EventManager.subscribe(self, EventUpdateStudentsTable)
    @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
  end

  def on_event(event)
    case event
    when EventUpdateStudentsTable
      puts event.new_table.to_2d_array
      @table.model_array = event.new_table.to_2d_array
    end
  end

  def update_student_count(new_cnt)
    @total_count = new_cnt
  end

  def create
    root = horizontal_box {
      # Секция 1
      vertical_box {
        stretchy false

        form {
          stretchy false

          @filter_last_name_initials = entry {
            label 'ФИО'
          }

          @filters = {}
          fields = [[:git, 'Github'], [:email, 'Почта'], [:phone, 'Телефон'], [:telegram, 'Телеграм']]

          fields.each do |field|
            @filters[field[0]] = {}

            @filters[field[0]][:combobox] = combobox {
              label "#{field[1]}?"
              items ['Не важно', 'Есть', 'Нет']
              selected 0

              on_selected do
                if @filters[field[0]][:combobox].selected == 1
                  @filters[field[0]][:entry].read_only = false
                else
                  @filters[field[0]][:entry].text = ''
                  @filters[field[0]][:entry].read_only = true
                end
              end
            }

            @filters[field[0]][:entry] = entry {
              label field[1]
              read_only true
            }
          end
        }
      }

      # Секция 2
      vertical_box {
        @table = refined_table(
          table_editable: false,
          table_columns: {
            '#' => :text,
            'Гит' => :text,
            'Контакт' => :text,
            'Фамилия И. О' => :text
          }
        )

        @pages = horizontal_box {
          stretchy false

          button('1')
          button('2')
          button('3')
          label('...') { stretchy false }
          button('20')
        }
      }

      # Секция 3
      vertical_box {
        stretchy true

        button('Добавить') { stretchy false }
        button('Изменить') { stretchy false }
        button('Удалить') { stretchy false }
        button('Обновить') { stretchy false }
      }
    }
    on_create
    root
  end

end