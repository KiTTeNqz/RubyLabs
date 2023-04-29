# frozen_string_literal: true

# Класс Наблюдаемый объект
class Subject
  attr_reader :state, :observers

  def initialize(state)
    @state = state
    @observers = []
  end

  def add_observer(observer)
    observers << observer
  end

  def remove_observer(observer)
    observers.delete(observer)
  end

  def notify_observers
    observers.each do |observer|
      observer.update(self)
    end
  end

  def update_state(state)
    @state = state
    notify_observers
  end
end

# Класс Наблюдатель
class Observer
  def update(subject)
    puts "Subject has updated state to: #{subject.state}"
  end
end

# Создаем объекты Наблюдаемый объект и Наблюдатель
subject = Subject.new("initial state")
observer = Observer.new

# Добавляем наблюдателя к наблюдаемому объекту
subject.add_observer(observer)

# Обновляем состояние наблюдаемого объекта
subject.update_state("new state")

# Результат выполнения:
# Subject has updated state to: new state

