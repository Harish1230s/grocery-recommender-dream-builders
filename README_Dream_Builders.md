# Dream Builders – Grocery Recommendation System

This project was developed as part of the **Foundations of Programming in Business Analytics (BUAN 6333)** course at UT Dallas. It focuses on building a grocery recommendation system using transactional data and logic-based modeling in R.

---

## 🧠 Project Goal

To design a lightweight, interpretable system that recommends grocery items based on items already in a shopper’s cart using historical co-purchase patterns and scoring rules.
-

## ⚙️ Features

- **Data Cleaning:** Removed duplicates and invalid records (missing items, IDs, etc.)
- **Transformation:** Converted wide format (Item_1, Item_2, ...) into long format using `pivot_longer`
- **Recommendation Logic:** Returns top 5 item suggestions based on frequency and cart overlap
- **Evaluation:** Used scoring logic (3–2–2–1–1) to assess one-item and two-item cart performance
- **Accuracy:** Achieved up to 80% accuracy in one-item tests and ~57% in two-item tests

---

## 📈 Example Use Case

```r
GetRecommendation(c("tropical fruit", "sliced cheese", "rolls/buns"), "Friday", "2023-07-21")
```
This returns a ranked list of items frequently co-purchased with the items above.

---

## 📌 Technologies Used

- R, dplyr, tidyr
- Custom scoring algorithms
- CSV and matrix manipulation
- Community-driven feedback & debugging

---

## 🤝 Team Contributions

Group Name: **Dream Builders**  
Contributors: Harish Kumar Sarathi, Athithyaa Muthuraman, Brighton Matibe, Venkatesh Prasad, Ragul Velmurugan

---

## 📄 Notes

- For future enhancement, integrating collaborative filtering or a lightweight ML model is recommended.
