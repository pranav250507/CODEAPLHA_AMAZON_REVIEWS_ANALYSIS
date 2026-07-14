CREATE DATABASE sentiment_analysis;
USE sentiment_analysis;
show tables;
select * from amazonreviewsorted limit 10;
describe amazonreviewsorted;
DELETE FROM amazonreviewsorted
WHERE reviews content IS NULL
   OR reviews content= '';
   ALTER TABLE amazonreviewsorted
DROP COLUMN `_6`,
DROP COLUMN `_7`,
DROP COLUMN `_8`,
DROP COLUMN `_9`,
DROP COLUMN `_10`,
DROP COLUMN `_11`,
DROP COLUMN `_12`,
DROP COLUMN `_13`,
DROP COLUMN `_14`,
DROP COLUMN `_15`,
DROP COLUMN `_16`,
DROP COLUMN `_17`,
DROP COLUMN `_18`,
DROP COLUMN `_19`,
DROP COLUMN `_20`,
DROP COLUMN `_21`,
DROP COLUMN `_22`,
DROP COLUMN `_23`,
DROP COLUMN `_24`,
DROP COLUMN `_25`,
DROP COLUMN `_26`,
DROP COLUMN `_27`,
DROP COLUMN `_28`,
DROP COLUMN `_29`,
DROP COLUMN `_30`,
DROP COLUMN `_31`,
DROP COLUMN `_32`,
DROP COLUMN `_33`,
DROP COLUMN `_34`,
DROP COLUMN `_35`,
DROP COLUMN `_36`,
DROP COLUMN `_37`,
DROP COLUMN `_38`,
DROP COLUMN `_39`,
DROP COLUMN `_40`,
DROP COLUMN `_41`,
DROP COLUMN `_42`,
DROP COLUMN `_43`,
DROP COLUMN `_44`,
DROP COLUMN `_45`,
DROP COLUMN `_46`,
DROP COLUMN `_47`,
DROP COLUMN `_48`,
DROP COLUMN `_49`,
DROP COLUMN `_50`,
DROP COLUMN `_51`,
DROP COLUMN `_52`,
DROP COLUMN `_53`,
DROP COLUMN `_54`,
DROP COLUMN `_55`,
DROP COLUMN `_56`,
DROP COLUMN `_57`,
DROP COLUMN `_58`,
DROP COLUMN `_59`,
DROP COLUMN `_60`,
DROP COLUMN `_61`,
DROP COLUMN `_62`,
DROP COLUMN `_63`,
DROP COLUMN `_64`,
DROP COLUMN `_65`,
DROP COLUMN `_66`,
DROP COLUMN `_67`,
DROP COLUMN `_68`,
DROP COLUMN `_69`,
DROP COLUMN `_70`,
DROP COLUMN `_71`,
DROP COLUMN `_72`,
DROP COLUMN `_73`,
DROP COLUMN `_74`,
DROP COLUMN `_75`,
DROP COLUMN `_76`,
DROP COLUMN `_77`,
DROP COLUMN `_78`,
DROP COLUMN `_79`,
DROP COLUMN `_80`,
DROP COLUMN `_81`,
DROP COLUMN `_82`,
DROP COLUMN `_83`,
DROP COLUMN `_84`,
DROP COLUMN `_85`,
DROP COLUMN `_86`,
DROP COLUMN `_87`,
DROP COLUMN `_88`;
SELECT COUNT(*) AS Total_Reviews
FROM amazonreviewsorted;
DESCRIBE amazonreviewsorted;
SELECT COUNT(*) AS Empty_Reviews

FROM amazonreviewsorted
WHERE `reviews content` IS NULL
OR `reviews content` = '';
UPDATE amazonreviewsorted
SET cleaned_review =
LOWER(
REGEXP_REPLACE(
`reviews content`,
'[^a-zA-Z ]',
''
)
);
SELECT
*
FROM amazonreviewsorted
LIMIT 10;
CREATE TABLE sentiment_dictionary
(
    word VARCHAR(50),
    sentiment VARCHAR(20)
);
INSERT INTO sentiment_dictionary VALUES
('good','Positive'),
('great','Positive'),
('excellent','Positive'),
('amazing','Positive'),
('awesome','Positive'),
('best','Positive'),
('love','Positive'),
('loved','Positive'),
('perfect','Positive'),
('nice','Positive'),
('fantastic','Positive'),
('wonderful','Positive'),
('happy','Positive'),
('fresh','Positive'),
('recommend','Positive'),
('recommended','Positive'),
('beautiful','Positive'),
('brilliant','Positive'),
('delicious','Positive'),
('favorite','Positive'),
('worth','Positive'),
('quality','Positive'),
('enjoy','Positive'),
('enjoyed','Positive'),
('pleasant','Positive'),
('fast','Positive'),
('easy','Positive'),
('smooth','Positive'),
('reliable','Positive'),
('impressive','Positive'),
('satisfied','Positive'),
('outstanding','Positive'),
('tasty','Positive'),
('rich','Positive'),
('clean','Positive'),
('effective','Positive'),
('superb','Positive'),
('comfortable','Positive'),
('durable','Positive'),
('valuable','Positive');
INSERT INTO sentiment_dictionary VALUES
('bad','Negative'),
('worst','Negative'),
('terrible','Negative'),
('poor','Negative'),
('awful','Negative'),
('hate','Negative'),
('hated','Negative'),
('broken','Negative'),
('waste','Negative'),
('boring','Negative'),
('problem','Negative'),
('cheap','Negative'),
('dirty','Negative'),
('disappointed','Negative'),
('disappointing','Negative'),
('expensive','Negative'),
('slow','Negative'),
('horrible','Negative'),
('refund','Negative'),
('return','Negative'),
('useless','Negative'),
('fake','Negative'),
('damaged','Negative'),
('weak','Negative'),
('hard','Negative'),
('difficult','Negative'),
('annoying','Negative'),
('defective','Negative'),
('failure','Negative'),
('fail','Negative'),
('cracked','Negative'),
('missing','Negative'),
('late','Negative'),
('delay','Negative'),
('stale','Negative'),
('burnt','Negative'),
('smelly','Negative'),
('bland','Negative'),
('overpriced','Negative'),
('unhappy','Negative');
CREATE TABLE review_sentiment
(
    review_id INT PRIMARY KEY,
    positive_count INT,
    negative_count INT,
    sentiment VARCHAR(20)
);
ALTER TABLE amazonreviewsorted
ADD COLUMN positive_count INT DEFAULT 0,
ADD COLUMN negative_count INT DEFAULT 0,
ADD COLUMN sentiment VARCHAR(20);
select * from amazonreviewsorted limit 10;
UPDATE amazonreviewsorted r
SET positive_count = (
    SELECT COUNT(*)
    FROM sentiment_dictionary d
    WHERE d.sentiment = 'Positive'
      AND r.cleaned_review LIKE CONCAT('%', d.word, '%')
);
UPDATE amazonreviewsorted r
SET negative_count = (
    SELECT COUNT(*)
    FROM sentiment_dictionary d
    WHERE d.sentiment = 'Negative'
      AND r.cleaned_review LIKE CONCAT('%', d.word, '%')
);
UPDATE amazonreviewsorted
SET sentiment =
CASE
    WHEN positive_count > negative_count THEN 'Positive'
    WHEN negative_count > positive_count THEN 'Negative'
    ELSE 'Neutral'
END;
SELECT
*
FROM amazonreviewsorted
LIMIT 20;
SELECT
sentiment,
COUNT(*) AS Total_Reviews
FROM amazonreviewsorted
GROUP BY sentiment;
SELECT
sentiment,
ROUND(
COUNT(*)*100/
(SELECT COUNT(*) FROM amazonreviewsorted),
2
) AS Percentage
FROM amazonreviewsorted
GROUP BY sentiment;
SELECT COUNT(*) AS Positive_Reviews
FROM amazonreviewsorted
WHERE sentiment='Positive';
SELECT COUNT(*) AS Negative_Reviews
FROM amazonreviewsorted
WHERE sentiment='Negative';
SELECT COUNT(*) AS Neutral_Reviews
FROM amazonreviewsorted
WHERE sentiment='Neutral';
SELECT
d.word,
COUNT(*) AS Frequency
FROM amazonreviewsorted r
JOIN sentiment_dictionary d
ON r.cleaned_review LIKE CONCAT('%', d.word, '%')
WHERE d.sentiment='Positive'
GROUP BY d.word
ORDER BY Frequency DESC
LIMIT 20;
SELECT
d.word,
COUNT(*) AS Frequency
FROM amazonreviewsorted r
JOIN sentiment_dictionary d
ON r.cleaned_review LIKE CONCAT('%', d.word, '%')
WHERE d.sentiment='Negative'
GROUP BY d.word
ORDER BY Frequency DESC
LIMIT 20;
SELECT
d.word,
COUNT(*) AS Frequency
FROM amazonreviewsorted r
JOIN sentiment_dictionary d
ON r.cleaned_review LIKE CONCAT('%', d.word, '%')
WHERE d.sentiment='Negative'
GROUP BY d.word
ORDER BY Frequency DESC
LIMIT 20;
ALTER TABLE amazonreviewsorted
ADD COLUMN review_length INT;
UPDATE amazonreviewsorted
SET review_length =
CHAR_LENGTH(`reviews content`);
SELECT

review_length
FROM amazonreviewsorted
LIMIT 20;
SELECT
`review title`,
review_length
FROM amazonreviewsorted
ORDER BY review_length DESC
LIMIT 10;
SELECT
`review title`,
review_length
FROM amazonreviewsorted
ORDER BY review_length ASC
LIMIT 10;
SELECT
AVG(positive_count) AS Avg_Positive_Words
FROM amazonreviewsorted;
SELECT
AVG(negative_count) AS Avg_Negative_Words
FROM amazonreviewsorted;
SELECT
*
FROM amazonreviewsorted;