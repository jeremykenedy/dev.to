class NotificationDecorator < Draper::Decorator
  delegate_all

  def mocked_object(type)
    struct = Struct.new(:name, :id) do
      def class
        second_struct = Struct.new(:name)
        second_struct.new(name)
      end
    end
    struct.new(json_data[type]["class"]["name"], json_data[type]["id"])
  end
end
