# frozen_string_literal: true

# frozen_string_literal: true
require 'glimmer-dsl-libui'
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
    @controller.refresh_data(@current_page, STUDENTS_PER_PAGE)
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
        @table = table {

          text_column('ФИО')
          text_column('Github')
          text_column('Контакт')

          editable false

          cell_rows [['Худокормов Д.А.', 'kittenqz', '+79094496999'],
                     ['Лукашев. А.А.', 'baran', '+79007008090'],
                     ['Гаврик Д.Р.', nil, 'gavrillo@mail.ru'],
                     ['Глызыренко Б.А.', 'TOP-G', nil]]
        }

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