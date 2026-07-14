# Amazon Product Review Sentiment Analysis

## Overview

This project performs **Sentiment Analysis** on Amazon product reviews using a **lexicon-based Natural Language Processing (NLP)** approach. The analysis classifies reviews into **Positive**, **Negative**, or **Neutral** sentiments by matching review text against predefined positive and negative word dictionaries.

The project demonstrates the complete data analytics workflow, including:

- Data Cleaning
- Sentiment Classification
- SQL-based Text Analysis
- Data Visualization using Tableau
- Dashboard Creation

---

## Project Objectives

- Analyze Amazon product reviews.
- Classify reviews into Positive, Negative, and Neutral sentiments.
- Create sentiment dictionaries using SQL.
- Generate sentiment statistics and insights.
- Visualize results through an interactive Tableau dashboard.

---

## Technologies Used

- **MySQL 8**
- **Tableau**
- **Microsoft Excel**
- **Git & GitHub**

---

## Dataset

The dataset contains Amazon product reviews with the following attributes:

- Review ID
- Review Title
- Review Content

Additional fields created during analysis:

- Cleaned Review
- Positive Count
- Negative Count
- Sentiment
- Review Length

---

## Project Workflow

```
Import CSV
        ↓
Data Cleaning
        ↓
Text Preprocessing
        ↓
Create Sentiment Dictionary
        ↓
Count Positive & Negative Words
        ↓
Sentiment Classification
        ↓
SQL Analysis
        ↓
Tableau Dashboard
```

---

## SQL Operations Performed

- Imported CSV dataset into MySQL
- Cleaned review text using regular expressions
- Created Positive & Negative word dictionaries
- Counted positive words in each review
- Counted negative words in each review
- Classified reviews into:
  - Positive
  - Negative
  - Neutral
- Calculated:
  - Total Reviews
  - Sentiment Distribution
  - Sentiment Percentage
  - Review Length
  - Most Frequent Positive Words
  - Most Frequent Negative Words

---

## Dashboard

The Tableau dashboard includes:

- Total Reviews KPI
- Positive Reviews KPI
- Negative Reviews KPI
- Neutral Reviews KPI
- Sentiment Distribution (Pie Chart)
- Sentiment Count (Bar Chart)
- Top Positive Reviews
- Sample Reviews Table





---

## Repository Structure

```
Amazon-Review-Sentiment-Analysis
│
├── amazon reviews analysis.csv
├── amazon reviews analysis.sql
├── amazon reviews analysis.twb
├── Amazon reviews analysis.png
└── README.md
```

---

## Sample Insights

- Reviews are automatically categorized based on sentiment scores.
- Positive reviews generally contain more positive keywords than negative ones.
- The dashboard provides an overview of customer opinions and review patterns.

---

## Future Improvements

- Implement Machine Learning-based sentiment analysis.
- Detect emotions such as Joy, Anger, Fear, and Surprise.
- Handle negation (e.g., "not good").
- Add Word Cloud visualization.
- Perform time-series sentiment trend analysis.

---

## Author

**Your Name**

GitHub: https://github.com/pranav250507

---

## License

This project is created for educational purposes.
