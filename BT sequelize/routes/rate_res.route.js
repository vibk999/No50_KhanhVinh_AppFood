import express from "express";
import {
  rateRestaurant,
  getAllRatings,
} from "../controllers/rate_res.controller";

const router = express.Router();

router.get("/", getAllRatings);
router.post("/", rateRestaurant);

export default router;
