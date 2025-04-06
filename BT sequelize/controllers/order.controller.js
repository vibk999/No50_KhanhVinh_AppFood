import * as orderService from "../services/order.service";

export const getAllOrders = async (req, res) => {
  try {
    const data = await orderService.getAll();
    res.json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export const placeOrder = async (req, res) => {
  try {
    const { user_id, food_id, amount, code, arr_sub_id } = req.body;
    const data = await orderService.create({
      user_id,
      food_id,
      amount,
      code,
      arr_sub_id,
    });
    res.status(201).json(data);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export const cancelOrder = async (req, res) => {
  try {
    await orderService.remove(req.params.id);
    res.json({ message: "Order canceled" });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
