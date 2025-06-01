class Order {
  int orderId;
  String customerName;
  double totalAmount;
  String status;

  Order(this.orderId, this.customerName, this.totalAmount, this.status);
}

void main() {
 
  Order order = Order(101, "Fatima", 500.0, "Pending");

  print("New Order ID: ${order.orderId}");
  print("Customer Name: ${order.customerName}");

  if (order.status == "Pending") {
    print("Order is pending.");
  }

  print("Total Amount: ${order.totalAmount}");
}
