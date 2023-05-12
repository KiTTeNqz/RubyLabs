# frozen_string_literal: true

require 'sinatra'
require 'mvcStudentXD'

set :port, 8000

puts MvcStudentXD.constants

students_model = MvcStudentXD::StudentListAdv.new(
  MvcStudentXD::StudentsListDBAdapter.new(
    MvcStudentXD::StudentListDB.instance))

main_controller = StudentListController.new(students_model)
main_controller.on_view_created = lambda { }
main_controller.on_add_student_clicked = lambda { }
main_controller.on_edit_student_clicked = lambda { |id| }

main_controller.selected_page = 0

editing_id = nil

get "/" do
  send_file 'web/main.html'
end

post "/students" do
  main_controller.refresh_data()
  result = main_controller.data_list.map { |student|
    student.as_json
  }

  result.to_json
end

post "/next_page" do
  main_controller.next_page()
  main_controller.refresh_data()
end

post "/last_page" do
  main_controller.last_page()
  main_controller.update_table()
end

get "/get_page" do
  (main_controller.selected_page + 1).to_s
end

get "/get_pages_count" do
  main_controller.pages_count.to_s
end

post "/set_editing_id:id" do
  puts params[:id]
  editing_id = params[:id]
end

get "/get_editing_id" do
  editing_id.to_s
end

post "/delete:id" do
  main_controller.remove_student(params[:id])
end

post "/editing:id" do
  student = main_controller.get_student(params[:id])
  [student.as_json].to_json
end

get "/add" do
  if editing_id == 'null'
    main_controller.show_modal_add
  else
    main_controller.show_modal_edit(editing_id)
  end
  send_file 'web/add.html'
end

get "/edit:student" do
  student = Student.from_json(JSON.parse(params[:student]))
  main_controller.replace_student(student.id, student)
end

get "/insert:student" do
  student = Student.from_json(JSON.parse(params[:student]))
  main_controller.add_student(student)
end
