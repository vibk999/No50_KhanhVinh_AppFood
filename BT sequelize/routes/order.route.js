import express from "express";
import {
  getAllOrders,
  placeOrder,
  cancelOrder,
} from "../controllers/order.controller";

const router = express.Router();

router.get("/", getAllOrders);
router.post("/", placeOrder);
router.delete("/:id", cancelOrder);

export default router;
