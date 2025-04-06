import * as rateService from "../services/rate_res.service";

export const getAllRatings = async (req, res) => {
  try {
    const ratings = await rateService.getAll();
    res.json(ratings);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

export const rateRestaurant = async (req, res) => {
  try {
    const { user_id, res_id, amount, date_rate } = req.body;
    const result = await rateService.create({
      user_id,
      res_id,
      amount,
      date_rate,
    });
    res.status(201).json(result);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
