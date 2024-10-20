// import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";

actor ListIt{
  type Todo = {
    itemID:Nat;
    item: Text;
    isCompleted: Bool;
  };

  var itemid: Nat = 0;

  type Buffer<X> = Buffer.Buffer<Todo>;

  let todoList: Buffer<Todo> = Buffer.Buffer<Todo>(100);

  public func addItem(_item : Text) {
    todoList.add({
      itemID = itemid;
      item = _item;
      isCompleted = false;
    });

    itemid+=1;
  };

  public query func fetchTodos(): async Text {
      var output: Text = "\n_____TO-DOs______";
    for (todo: Todo in todoList.vals()) {
      output #= "\n" # todo.item;
      if (todo.isCompleted){ output #="       X";};
    };
    output # "\n"
  };

    public func completeTodo(id: Nat) : async (){

    ignore do ? {
      let td = todoList.get(id);
      let it = td.item;
      todoList.put(id,{itemID=id; item=it; isCompleted = true});
    }

  };


};
